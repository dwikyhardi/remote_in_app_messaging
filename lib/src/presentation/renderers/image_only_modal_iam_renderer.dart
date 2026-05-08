import 'package:flutter/material.dart';

import '../../domain/entities/iam_content.dart';
import '../widgets/iam_image.dart';
import '../widgets/iam_style_ext.dart';
import 'iam_body_dispatcher.dart';
import 'iam_renderer.dart';

/// Renders an [IamContent] as an image-only modal: the image fills the
/// dialog, with a translucent close chip overlaid in the top-right corner.
///
/// When [IamContent.primaryCta] is set, tapping anywhere on the image fires
/// the CTA (returns [IamRenderResult.cta]). Otherwise the image is purely
/// decorative and the user dismisses via the close chip, the barrier, or the
/// system back gesture.
///
/// Empty / null `content.imageUrl` resolves synchronously to
/// [IamRenderResult.dismissed] without opening a dialog, so the campaign
/// cannot wedge the coordinator's `_showing` lock.
class ImageOnlyModalIamRenderer implements IamRenderer {
  const ImageOnlyModalIamRenderer({this.barrierDismissible = true});

  final bool barrierDismissible;

  @override
  Future<IamRenderResult> show({
    required BuildContext context,
    required IamContent content,
    bool showCloseButton = true,
  }) async {
    final imageUrl = content.imageUrl;
    if (imageUrl == null || imageUrl.isEmpty) {
      debugPrint(
        '[remote_in_app_messaging] ImageOnlyModalIamRenderer: '
        'empty imageUrl, skipping display',
      );
      return const IamRenderResult.dismissed();
    }

    final style = content.style;
    final fit = style?.imageFit?.toBoxFit() ?? BoxFit.contain;
    final styledHeight = style?.imageHeight;
    final styledWidth = style?.imageWidth;

    final result = await showDialog<IamRenderResult>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext ctx) {
        final maxImageHeight = MediaQuery.of(ctx).size.height * 0.7;
        return Dialog(
          insetPadding: const EdgeInsets.all(24),
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: maxImageHeight),
                  child: _MaybeTappable(
                    onTap: content.primaryCta == null
                        ? null
                        : () => Navigator.of(ctx).pop(
                            IamRenderResult.cta(content.primaryCta),
                          ),
                    child: IamImage(
                      path: imageUrl,
                      fit: fit,
                      height: styledHeight,
                      width: styledWidth,
                    ),
                  ),
                ),
                if (showCloseButton)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: _CloseChip(
                      onTap: () => Navigator.of(ctx).pop(
                        const IamRenderResult.dismissed(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
    return resolveResult(result);
  }
}

class _MaybeTappable extends StatelessWidget {
  const _MaybeTappable({required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    if (onTap == null) return child;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: child,
    );
  }
}

class _CloseChip extends StatelessWidget {
  const _CloseChip({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.45),
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: IconButton(
        icon: const Icon(Icons.close, color: Colors.white),
        tooltip: 'Close',
        splashRadius: 20,
        iconSize: 20,
        onPressed: onTap,
      ),
    );
  }
}
