import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remote_in_app_messaging/remote_in_app_messaging.dart';

void main() {
  Widget pumpHarness({
    required void Function(BuildContext) onPressed,
  }) {
    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            body: ElevatedButton(
              onPressed: () => onPressed(context),
              child: const Text('open'),
            ),
          );
        },
      ),
    );
  }

  testWidgets(
    'ImageOnlyModalIamRenderer renders image and close chip when imageUrl set',
    (WidgetTester tester) async {
      late Future<IamRenderResult> resultFuture;

      await tester.pumpWidget(
        pumpHarness(
          onPressed: (BuildContext ctx) {
            resultFuture = const ImageOnlyModalIamRenderer().show(
              context: ctx,
              content: const IamContent(
                imageUrl: 'https://example.com/img.png',
              ),
            );
          },
        ),
      );

      await tester.tap(find.text('open'));
      await tester.pump(); // open dialog
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(Dialog), findsOneWidget);
      expect(find.byType(IamImage), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      final result = await resultFuture;
      expect(result.outcome, IamRenderOutcome.dismissed);
    },
  );

  testWidgets(
    'ImageOnlyModalIamRenderer fires primaryCta when image is tapped',
    (WidgetTester tester) async {
      late Future<IamRenderResult> resultFuture;
      const cta = IamCta(
        label: 'Open',
        action: IamActionType.deepLink,
        url: '/details',
      );

      await tester.pumpWidget(
        pumpHarness(
          onPressed: (BuildContext ctx) {
            resultFuture = const ImageOnlyModalIamRenderer().show(
              context: ctx,
              content: const IamContent(
                imageUrl: 'https://example.com/img.png',
                primaryCta: cta,
              ),
            );
          },
        ),
      );

      await tester.tap(find.text('open'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(IamImage), findsOneWidget);

      await tester.tap(find.byType(IamImage));
      await tester.pumpAndSettle();

      final result = await resultFuture;
      expect(result.outcome, IamRenderOutcome.ctaTapped);
      expect(result.cta?.label, 'Open');
      expect(result.cta?.action, IamActionType.deepLink);
      expect(result.cta?.url, '/details');
    },
  );

  testWidgets(
    'ImageOnlyModalIamRenderer empty imageUrl resolves to dismissed '
    'without dialog',
    (WidgetTester tester) async {
      late Future<IamRenderResult> resultFuture;

      await tester.pumpWidget(
        pumpHarness(
          onPressed: (BuildContext ctx) {
            resultFuture = const ImageOnlyModalIamRenderer().show(
              context: ctx,
              content: const IamContent(),
            );
          },
        ),
      );

      await tester.tap(find.text('open'));
      await tester.pump();

      expect(find.byType(Dialog), findsNothing);
      expect(find.byType(IamImage), findsNothing);

      final result = await resultFuture;
      expect(result.outcome, IamRenderOutcome.dismissed);
    },
  );

  testWidgets(
    'ImageOnlyModalIamRenderer applies imageFit / imageHeight / imageWidth '
    'from IamContent.style to IamImage',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpHarness(
          onPressed: (BuildContext ctx) {
            const ImageOnlyModalIamRenderer().show(
              context: ctx,
              content: const IamContent(
                imageUrl: 'https://example.com/img.png',
                style: IamBodyStyle(
                  imageFit: IamBoxFit.cover,
                  imageHeight: 240,
                  imageWidth: 320,
                ),
              ),
            );
          },
        ),
      );

      await tester.tap(find.text('open'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      final iamImage = tester.widget<IamImage>(find.byType(IamImage));
      expect(iamImage.fit, BoxFit.cover);
      expect(iamImage.height, 240);
      expect(iamImage.width, 320);
    },
  );

  testWidgets(
    'ImageOnlyModalIamRenderer falls back to BoxFit.contain when style is '
    'absent',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpHarness(
          onPressed: (BuildContext ctx) {
            const ImageOnlyModalIamRenderer().show(
              context: ctx,
              content: const IamContent(
                imageUrl: 'https://example.com/img.png',
              ),
            );
          },
        ),
      );

      await tester.tap(find.text('open'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      final iamImage = tester.widget<IamImage>(find.byType(IamImage));
      expect(iamImage.fit, BoxFit.contain);
      expect(iamImage.height, isNull);
      expect(iamImage.width, isNull);
    },
  );

  testWidgets(
    'ImageOnlyModalIamRenderer hides close chip when showCloseButton is false',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpHarness(
          onPressed: (BuildContext ctx) {
            const ImageOnlyModalIamRenderer().show(
              context: ctx,
              content: const IamContent(
                imageUrl: 'https://example.com/img.png',
              ),
              showCloseButton: false,
            );
          },
        ),
      );

      await tester.tap(find.text('open'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(IamImage), findsOneWidget);
      expect(find.byIcon(Icons.close), findsNothing);
    },
  );
}
