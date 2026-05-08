import 'dart:convert';

import '../../domain/entities/in_app_message.dart';
import '../../domain/iam_host_bindings.dart';

/// Signature for a host-supplied error logger. Kept available so existing
/// callers that already store `bindings.logError` as a tear-off can keep
/// passing it directly into the parser.
typedef IamErrorLogger =
    void Function(
      Object error, [
      StackTrace? stackTrace,
      String? context,
    ]);

/// Tolerant parser for the IAM JSON payload.
///
/// Top-level shape (extra/unknown fields are ignored):
/// ```json
/// { "version": 1, "messages": [ { ...InAppMessage... }, ... ] }
/// ```
///
/// Parsing policy:
/// - Unknown top-level keys → ignored.
/// - Missing or non-list `messages` → empty list.
/// - Each malformed entry in `messages` is skipped; others still load.
/// - Any `logError` callback is invoked per failure; never throws.
class InAppMessagesParser {
  /// Constructs a parser with an optional [logError] callback.
  const InAppMessagesParser({IamErrorLogger? logError}) : _logError = logError;

  /// Convenience ctor that wires the logger from a full [IamHostBindings].
  ///
  /// Equivalent to `InAppMessagesParser(logError: bindings.logError)` but
  /// keeps the dependency direction explicit at the call site.
  factory InAppMessagesParser.fromBindings(IamHostBindings bindings) =>
      InAppMessagesParser(logError: bindings.logError);

  final IamErrorLogger? _logError;

  /// Parse a JSON [source] string into a list of [InAppMessage]s.
  ///
  /// Returns an empty list if the payload is empty, null, or fundamentally
  /// unparseable (e.g. invalid JSON at the top level).
  List<InAppMessage> parse(String? source) {
    if (source == null || source.trim().isEmpty) {
      return const <InAppMessage>[];
    }
    try {
      final decoded = jsonDecode(source);
      return parseMap(decoded);
    } catch (e, st) {
      _report(e, st, 'InAppMessagesParser.parse: jsonDecode failed');
      return const <InAppMessage>[];
    }
  }

  /// Parse an already-decoded JSON value.
  ///
  /// Accepts either:
  /// - a `Map<String, dynamic>` with a `messages` list, or
  /// - a bare `List` of message maps.
  List<InAppMessage> parseMap(Object? decoded) {
    final List<dynamic> rawMessages;
    if (decoded is Map) {
      final m = decoded['messages'];
      if (m is List) {
        rawMessages = m;
      } else {
        return const <InAppMessage>[];
      }
    } else if (decoded is List) {
      rawMessages = decoded;
    } else {
      return const <InAppMessage>[];
    }

    final result = <InAppMessage>[];
    for (var i = 0; i < rawMessages.length; i++) {
      final entry = rawMessages[i];
      if (entry is! Map) {
        _skip(i, ArgumentError('entry is not a Map'));
        continue;
      }
      try {
        final map = Map<String, dynamic>.from(entry);
        final id = map['id'];
        if (id is! String || id.isEmpty) {
          _skip(i, ArgumentError('missing or empty "id"'));
          continue;
        }
        result.add(InAppMessage.fromJson(map));
      } catch (e, st) {
        _skip(i, e, st);
      }
    }
    return result;
  }

  /// Logs a per-entry skip and continues parsing.
  void _skip(int i, Object err, [StackTrace? st]) {
    _report(err, st, 'InAppMessagesParser: skipping messages[$i]');
  }

  void _report(Object error, StackTrace? st, String context) {
    final log = _logError;
    if (log == null) return;
    try {
      log(error, st, context);
    } catch (_) {
      // Never let a broken logger bring the parser down.
    }
  }
}
