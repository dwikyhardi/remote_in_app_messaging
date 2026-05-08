import 'package:flutter/widgets.dart';

import '../../domain/entities/iam_content.dart';
import '../widgets/iam_body.dart';
import 'iam_renderer.dart';

/// Internal helper shared by `ModalIamRenderer`, `BottomSheetIamRenderer`,
/// and `FullscreenIamRenderer`.
///
/// The 3 standard renderers all forward the same `IamContent` to [IamBody]
/// with identical pop-to-result callbacks for primary CTA, secondary CTA, and
/// close. This helper centralizes that wiring so each renderer collapses to
/// just its surface-specific framing (dialog / sheet / route).
///
/// {@template iam_body_dispatcher.crossAxisAlignment}
/// [crossAxisAlignment] / [fullscreen] map to the corresponding [IamBody]
/// arguments verbatim.
/// {@endtemplate}
IamBody buildDispatchedIamBody(
  BuildContext context,
  IamContent content, {
  bool showCloseButton = true,
  CrossAxisAlignment? crossAxisAlignment,
  bool fullscreen = false,
}) {
  return IamBody(
    content: content,
    showCloseButton: showCloseButton,
    crossAxisAlignment: crossAxisAlignment,
    fullscreen: fullscreen,
    onPrimaryCta: () =>
        Navigator.of(context).pop(IamRenderResult.cta(content.primaryCta)),
    onSecondaryCta: () =>
        Navigator.of(context).pop(IamRenderResult.cta(content.secondaryCta)),
    onClose: () =>
        Navigator.of(context).pop(const IamRenderResult.dismissed()),
  );
}

/// Collapses a nullable [IamRenderResult] (returned by `showDialog`,
/// `showModalBottomSheet`, or `Navigator.push`) into a non-null result by
/// treating `null` as a dismiss outcome.
IamRenderResult resolveResult(IamRenderResult? result) =>
    result ?? const IamRenderResult.dismissed();
