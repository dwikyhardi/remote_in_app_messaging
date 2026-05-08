import 'package:flutter/material.dart';

import '../../domain/entities/iam_content.dart';
import 'iam_body_dispatcher.dart';
import 'iam_renderer.dart';

/// Renders an [IamContent] as a modal bottom sheet card.
class BottomSheetIamRenderer implements IamRenderer {
  const BottomSheetIamRenderer();

  @override
  Future<IamRenderResult> show({
    required BuildContext context,
    required IamContent content,
    bool showCloseButton = true,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool showDragHandle = true,
  }) async {
    final result = await showModalBottomSheet<IamRenderResult>(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      showDragHandle: showDragHandle,
      builder: (BuildContext ctx) => SafeArea(
        child: buildDispatchedIamBody(
          ctx,
          content,
          showCloseButton: showCloseButton,
        ),
      ),
    );
    return resolveResult(result);
  }
}
