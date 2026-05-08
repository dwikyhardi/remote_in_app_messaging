import 'package:hive_ce/hive.dart';

import '../../domain/entities/iam_message_state.dart';
import '../../domain/iam_host_bindings.dart';
import 'iam_state_store.dart';

/// Default Hive box name used by [HiveIamStateStore].
const String defaultIamStateBoxName = 'iam_state';

/// Signature for an optional error logger, kept compatible with
/// [IamHostBindings.logError] tear-offs.
typedef HiveIamStoreErrorLogger =
    void Function(
      Object error, [
      StackTrace? stackTrace,
      String? context,
    ]);

/// Hive-backed implementation of [IamStateStore].
///
/// Stores each [IamMessageState] as its JSON map (via `toJson()` / `fromJson`).
/// This avoids the need to register a dedicated `TypeAdapter` for the freezed
/// model and keeps the on-disk format self-describing and forward-compatible.
///
/// Host apps should open the box during bootstrap (typically alongside their
/// other Hive boxes) and pass it to the constructor:
///
/// ```dart
/// final box = await Hive.openBox<Map>('iam_state');
/// final store = HiveIamStateStore(box);
/// ```
class HiveIamStateStore implements IamStateStore {
  HiveIamStateStore(this._box, {HiveIamStoreErrorLogger? logError})
    : _logError = logError;

  /// Convenience ctor that wires the logger from a full [IamHostBindings].
  HiveIamStateStore.fromBindings(Box<dynamic> box, IamHostBindings bindings)
    : this(box, logError: bindings.logError);

  final Box<dynamic> _box;
  final HiveIamStoreErrorLogger? _logError;

  /// Convenience factory: opens (or reuses) the Hive box with [boxName] and
  /// returns a ready-to-use store. The host is responsible for calling
  /// `Hive.init(...)` / `Hive.initFlutter(...)` before invoking this.
  static Future<HiveIamStateStore> open({
    String boxName = defaultIamStateBoxName,
    HiveIamStoreErrorLogger? logError,
  }) async {
    final box = Hive.isBoxOpen(boxName)
        ? Hive.box<dynamic>(boxName)
        : await Hive.openBox<dynamic>(boxName);
    return HiveIamStateStore(box, logError: logError);
  }

  @override
  IamMessageState? read(String messageId) {
    final Object? raw = _box.get(messageId);
    if (raw is Map) {
      try {
        return IamMessageState.fromJson(Map<String, dynamic>.from(raw));
      } catch (e, st) {
        _report(e, st, 'HiveIamStateStore.read: corrupted entry "$messageId"');
        return null;
      }
    }
    return null;
  }

  @override
  Future<void> write(String messageId, IamMessageState state) async {
    await _box.put(messageId, state.toJson());
  }

  @override
  Future<IamMessageState> mutate(
    String messageId,
    IamMessageState Function(IamMessageState current) update,
  ) async {
    final current = read(messageId) ?? const IamMessageState();
    final next = update(current);
    await write(messageId, next);
    return next;
  }

  @override
  Future<void> delete(String messageId) async {
    await _box.delete(messageId);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }

  void _report(Object error, StackTrace? st, String context) {
    final log = _logError;
    if (log == null) return;
    try {
      log(error, st, context);
    } catch (_) {
      // Never let a broken logger bring the store down.
    }
  }
}
