import 'package:freezed_annotation/freezed_annotation.dart';

part 'iam_message_state.freezed.dart';
part 'iam_message_state.g.dart';

/// Per-message persisted state. Keyed by `InAppMessage.id` in the state store.
///
/// The Hive adapter for this model is registered by the state store in Step 3.
@freezed
abstract class IamMessageState with _$IamMessageState {
  const factory IamMessageState({
    @Default(0) int impressions,
    DateTime? lastShownAt,
    @Default(false) bool dismissed,
    @Default(false) bool ctaClicked,
    int? stickyVariantIndex,
  }) = _IamMessageState;

  factory IamMessageState.fromJson(Map<String, dynamic> json) =>
      _$IamMessageStateFromJson(json);
}
