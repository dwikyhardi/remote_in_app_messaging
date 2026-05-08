import 'package:freezed_annotation/freezed_annotation.dart';

import 'iam_enums.dart';
import 'iam_frequency.dart';
import 'iam_targeting.dart';
import 'iam_trigger.dart';
import 'iam_variant.dart';

part 'in_app_message.freezed.dart';
part 'in_app_message.g.dart';

@freezed
abstract class InAppMessage with _$InAppMessage {
  const factory InAppMessage({
    required String id,
    @Default(true) bool enabled,
    @Default(IamLayout.modal) IamLayout layout,
    DateTime? startAt,
    DateTime? endAt,
    @Default(IamTrigger()) IamTrigger trigger,
    @Default(IamTargeting()) IamTargeting targeting,
    @Default(IamFrequency()) IamFrequency frequency,
    @Default(<IamVariant>[]) List<IamVariant> variants,
    @Default(true) bool showCloseButton,
  }) = _InAppMessage;

  factory InAppMessage.fromJson(Map<String, dynamic> json) =>
      _$InAppMessageFromJson(json);
}
