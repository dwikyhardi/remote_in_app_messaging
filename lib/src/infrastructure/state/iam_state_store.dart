import '../../domain/entities/iam_message_state.dart';

/// Per-message persistence contract. Keyed by `InAppMessage.id`.
///
/// Implementations may back this with Hive, SharedPreferences, or an in-memory
/// store (used in tests).
abstract class IamStateStore {
  /// Returns the persisted state for [messageId], or `null` if none yet.
  IamMessageState? read(String messageId);

  /// Upserts the persisted state for [messageId].
  Future<void> write(String messageId, IamMessageState state);

  /// Atomically mutates the state for [messageId]: reads current (defaulting
  /// to `IamMessageState()`), applies [update], and writes the result.
  Future<IamMessageState> mutate(
    String messageId,
    IamMessageState Function(IamMessageState current) update,
  );

  /// Removes the state for [messageId] (e.g., for testing / admin reset).
  Future<void> delete(String messageId);

  /// Clears all persisted state (e.g., on logout).
  Future<void> clear();
}

/// In-memory implementation of [IamStateStore].
///
/// Used in unit tests and as a safe no-op fallback before Hive is initialized.
class InMemoryIamStateStore implements IamStateStore {
  final Map<String, IamMessageState> _data = <String, IamMessageState>{};

  @override
  IamMessageState? read(String messageId) => _data[messageId];

  @override
  Future<void> write(String messageId, IamMessageState state) async {
    _data[messageId] = state;
  }

  @override
  Future<IamMessageState> mutate(
    String messageId,
    IamMessageState Function(IamMessageState current) update,
  ) async {
    final next = update(_data[messageId] ?? const IamMessageState());
    _data[messageId] = next;
    return next;
  }

  @override
  Future<void> delete(String messageId) async {
    _data.remove(messageId);
  }

  @override
  Future<void> clear() async {
    _data.clear();
  }
}
