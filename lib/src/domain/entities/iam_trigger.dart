import 'package:freezed_annotation/freezed_annotation.dart';

import 'iam_enums.dart';

part 'iam_trigger.freezed.dart';
part 'iam_trigger.g.dart';

@freezed
abstract class IamTrigger with _$IamTrigger {
  const factory IamTrigger({
    @Default(IamTriggerType.onLaunch) IamTriggerType type,
    String? routePath,
    String? eventName,
    @Default(<String, dynamic>{}) Map<String, dynamic> eventParamsMatch,
    @Default(0) int delayMs,
  }) = _IamTrigger;

  factory IamTrigger.fromJson(Map<String, dynamic> json) =>
      _$IamTriggerFromJson(json);
}
