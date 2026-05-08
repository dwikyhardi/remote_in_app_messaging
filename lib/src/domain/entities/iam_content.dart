import 'package:freezed_annotation/freezed_annotation.dart';

import 'iam_cta.dart';
import 'iam_style.dart';

part 'iam_content.freezed.dart';
part 'iam_content.g.dart';

@freezed
abstract class IamContent with _$IamContent {
  const factory IamContent({
    @Default('') String title,
    @Default('') String body,
    String? imageUrl,
    IamCta? primaryCta,
    IamCta? secondaryCta,
    String? backgroundColor,
    String? textColor,

    /// Optional visual overrides for the `IamBody` widget, shipped in the
    /// remote JSON payload.
    ///
    /// Values defined here are used as defaults when the widget-level
    /// parameters on `IamBody` are not provided. Widget-level params always
    /// win.
    IamBodyStyle? style,
  }) = _IamContent;

  factory IamContent.fromJson(Map<String, dynamic> json) =>
      _$IamContentFromJson(json);
}
