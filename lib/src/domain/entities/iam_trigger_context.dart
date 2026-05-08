import 'package:freezed_annotation/freezed_annotation.dart';

part 'iam_trigger_context.freezed.dart';

/// Runtime context describing what fired an IAM evaluation tick.
@freezed
sealed class IamTriggerContext with _$IamTriggerContext {
  const factory IamTriggerContext.launch() = IamTriggerLaunch;

  const factory IamTriggerContext.route(String path) = IamTriggerRoute;

  const factory IamTriggerContext.event(
    String name, {
    @Default(<String, dynamic>{}) Map<String, dynamic> params,
  }) = IamTriggerEvent;
}
