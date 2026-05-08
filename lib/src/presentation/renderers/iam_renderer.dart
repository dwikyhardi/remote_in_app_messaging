// ignore_for_file: one_member_abstracts

import 'package:flutter/widgets.dart';

import '../../domain/entities/iam_content.dart';
import '../../domain/entities/iam_cta.dart';

/// Outcome of showing an IAM surface.
enum IamRenderOutcome {
  /// User dismissed the message (tap outside / back / close CTA).
  dismissed,

  /// User tapped the primary or secondary CTA (the coordinator handles the
  /// action). The tapped CTA is carried via [IamRenderResult.cta].
  ctaTapped,
}

class IamRenderResult {
  const IamRenderResult({required this.outcome, this.cta});

  const IamRenderResult.dismissed()
    : outcome = IamRenderOutcome.dismissed,
      cta = null;

  const IamRenderResult.cta(this.cta) : outcome = IamRenderOutcome.ctaTapped;

  final IamRenderOutcome outcome;
  final IamCta? cta;
}

/// Contract every IAM renderer (modal / bottom sheet / fullscreen) satisfies.
///
/// Implementations are responsible only for **presentation** — they do not
/// perform analytics, persistence, or CTA dispatch. The coordinator awaits the
/// future and acts on the returned [IamRenderResult].
abstract class IamRenderer {
  Future<IamRenderResult> show({
    required BuildContext context,
    required IamContent content,
    bool showCloseButton = true,
  });
}
