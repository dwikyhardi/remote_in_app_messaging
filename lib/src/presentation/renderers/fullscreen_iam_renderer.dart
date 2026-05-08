import 'package:flutter/material.dart';

import '../../domain/entities/iam_content.dart';
import 'iam_body_dispatcher.dart';
import 'iam_renderer.dart';

/// Renders an [IamContent] as a fullscreen takeover route.
class FullscreenIamRenderer implements IamRenderer {
  const FullscreenIamRenderer();

  @override
  Future<IamRenderResult> show({
    required BuildContext context,
    required IamContent content,
    bool showCloseButton = true,
  }) async {
    final result = await Navigator.of(context).push<IamRenderResult>(
      MaterialPageRoute<IamRenderResult>(
        fullscreenDialog: true,
        builder: (BuildContext ctx) => Scaffold(
          body: SafeArea(
            child: buildDispatchedIamBody(
              ctx,
              content,
              showCloseButton: showCloseButton,
              fullscreen: true,
            ),
          ),
        ),
      ),
    );
    return resolveResult(result);
  }
}
