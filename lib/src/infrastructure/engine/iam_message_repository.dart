import 'dart:async';

import '../../domain/entities/in_app_message.dart';
import '../../domain/iam_host_bindings.dart';
import '../parser/in_app_messages_parser.dart';

/// Owns parsed-messages caching and reload semantics.
///
/// Extracted from `InAppMessagingCoordinator` to satisfy SRP: the coordinator
/// orchestrates trigger ticks, this class handles "where do messages come
/// from + how are they cached".
///
class IamMessageRepository {
  IamMessageRepository({
    required IamHostBindings bindings,
    InAppMessagesParser? parser,
  }) : _bindings = bindings,
       _parser = parser ?? InAppMessagesParser.fromBindings(bindings);

  final IamHostBindings _bindings;
  final InAppMessagesParser _parser;

  List<InAppMessage>? _cachedMessages;
  Future<List<InAppMessage>>? _inFlight;

  /// Returns the parsed messages, fetching + parsing on first call.
  ///
  /// Concurrent callers reuse the same in-flight future so
  /// `IamHostBindings.loadMessagesJson` is invoked at most once even under
  /// heavy contention.
  Future<List<InAppMessage>> load() {
    final cached = _cachedMessages;
    if (cached != null) return Future<List<InAppMessage>>.value(cached);
    final inFlight = _inFlight;
    if (inFlight != null) return inFlight;

    final fetch = _fetch();
    _inFlight = fetch;
    return fetch;
  }

  Future<List<InAppMessage>> _fetch() async {
    try {
      final raw = await _bindings.loadMessagesJson();
      final parsed = _parser.parse(raw);
      _cachedMessages = parsed;
      return parsed;
    } finally {
      _inFlight = null;
    }
  }

  /// Drops the cache, forcing the next [load] to refetch and re-parse.
  void invalidate() {
    _cachedMessages = null;
  }
}
