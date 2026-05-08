import 'package:freezed_annotation/freezed_annotation.dart';

import 'iam_enums.dart';
import 'iam_style.dart';

part 'iam_cta.freezed.dart';
part 'iam_cta.g.dart';

@freezed
abstract class IamCta with _$IamCta {
  const factory IamCta({
    @Default('') String label,
    @Default(IamActionType.close) IamActionType action,
    String? url,

    /// Optional per-CTA visual overrides, shipped in the remote JSON payload.
    ///
    /// Values defined here are used as defaults when the widget-level
    /// parameters on `IamCtaButton` are not provided. Widget-level params
    /// always win.
    IamCtaButtonStyle? style,
  }) = _IamCta;

  factory IamCta.fromJson(Map<String, dynamic> json) => _$IamCtaFromJson(json);
}
