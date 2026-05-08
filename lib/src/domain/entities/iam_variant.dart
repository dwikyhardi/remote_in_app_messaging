import 'package:freezed_annotation/freezed_annotation.dart';

import 'iam_content.dart';

part 'iam_variant.freezed.dart';
part 'iam_variant.g.dart';

@freezed
abstract class IamVariant with _$IamVariant {
  const factory IamVariant({
    @Default(1) int weight,
    @Default(IamContent()) IamContent content,
  }) = _IamVariant;

  factory IamVariant.fromJson(Map<String, dynamic> json) =>
      _$IamVariantFromJson(json);
}
