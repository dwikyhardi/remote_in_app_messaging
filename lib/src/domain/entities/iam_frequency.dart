import 'package:freezed_annotation/freezed_annotation.dart';

import 'iam_enums.dart';

part 'iam_frequency.freezed.dart';
part 'iam_frequency.g.dart';

@freezed
abstract class IamFrequency with _$IamFrequency {
  const factory IamFrequency({
    int? maxImpressions,
    @Default(IamDismissBehavior.doNotShowAgain)
    IamDismissBehavior dismissBehavior,
  }) = _IamFrequency;

  factory IamFrequency.fromJson(Map<String, dynamic> json) =>
      _$IamFrequencyFromJson(json);
}
