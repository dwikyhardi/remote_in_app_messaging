import 'package:flutter/material.dart';

import '../../domain/entities/iam_content.dart';
import 'iam_body_dispatcher.dart';
import 'iam_renderer.dart';

/// Renders an [IamContent] as a centered modal dialog.
class ModalIamRenderer implements IamRenderer {
  const ModalIamRenderer();

  @override
  Future<IamRenderResult> show({
    required BuildContext context,
    required IamContent content,
    bool showCloseButton = true,
    bool barrierDismissible = true,
  }) async {
    final result = await showDialog<IamRenderResult>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext ctx) => Dialog(
        insetPadding: const EdgeInsets.all(24),
        child: buildDispatchedIamBody(
          ctx,
          content,
          showCloseButton: showCloseButton,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
    return resolveResult(result);
  }
}
