import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remote_in_app_messaging/remote_in_app_messaging.dart';

void main() {
  testWidgets(
    'ModalIamRenderer renders title/body/CTAs and returns CTA result',
    (WidgetTester tester) async {
      late Future<IamRenderResult> resultFuture;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    resultFuture = const ModalIamRenderer().show(
                      context: context,
                      content: const IamContent(
                        title: 'Hello',
                        body: 'World',
                        primaryCta: IamCta(
                          label: 'Go',
                          action: IamActionType.deepLink,
                          url: '/x',
                        ),
                        secondaryCta: IamCta(
                          label: 'Later',
                        ),
                      ),
                    );
                  },
                  child: const Text('open'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();

      expect(find.text('Hello'), findsOneWidget);
      expect(find.text('World'), findsOneWidget);
      expect(find.text('Go'), findsOneWidget);
      expect(find.text('Later'), findsOneWidget);

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      final result = await resultFuture;
      expect(result.outcome, IamRenderOutcome.ctaTapped);
      expect(result.cta?.label, 'Go');
      expect(result.cta?.action, IamActionType.deepLink);
    },
  );

  testWidgets('ModalIamRenderer close button returns dismissed', (
    WidgetTester tester,
  ) async {
    late Future<IamRenderResult> resultFuture;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: ElevatedButton(
                onPressed: () {
                  resultFuture = const ModalIamRenderer().show(
                    context: context,
                    content: const IamContent(title: 'Hi', body: 'Body'),
                  );
                },
                child: const Text('open'),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    final result = await resultFuture;
    expect(result.outcome, IamRenderOutcome.dismissed);
  });

  testWidgets(
    'IamBody with imageUrl wraps the close button in a translucent '
    'circular chip so it stays visible over the image',
    (WidgetTester tester) async {
      const content = IamContent(
        title: 'Hi',
        body: 'Body',
        imageUrl: 'https://example.com/x.png',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IamBody(
              content: content,
              onPrimaryCta: () {},
              onSecondaryCta: () {},
              onClose: () {},
            ),
          ),
        ),
      );

      // The close icon must be wrapped in a Material circle ancestor with a
      // non-null fill color so it stays visible over the image.
      final iconButtonFinder = find.byIcon(Icons.close);
      expect(iconButtonFinder, findsOneWidget);

      final materialFinder = find.ancestor(
        of: iconButtonFinder,
        matching: find.byWidgetPredicate(
          (Widget w) =>
              w is Material &&
              w.shape is CircleBorder &&
              w.color != null,
        ),
      );
      expect(materialFinder, findsOneWidget);
    },
  );

  testWidgets(
    'IamBody without imageUrl does NOT add the circular chip (no '
    'visual regression for legacy text-only modals)',
    (WidgetTester tester) async {
      const content = IamContent(title: 'Hi', body: 'Body');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IamBody(
              content: content,
              onPrimaryCta: () {},
              onSecondaryCta: () {},
              onClose: () {},
            ),
          ),
        ),
      );

      final iconButtonFinder = find.byIcon(Icons.close);
      expect(iconButtonFinder, findsOneWidget);

      final chipFinder = find.ancestor(
        of: iconButtonFinder,
        matching: find.byWidgetPredicate(
          (Widget w) =>
              w is Material && w.shape is CircleBorder && w.color != null,
        ),
      );
      expect(chipFinder, findsNothing);
    },
  );

  testWidgets(
    'IamBody honors JSON closeButtonBackgroundColor over the image '
    'default',
    (WidgetTester tester) async {
      const content = IamContent(
        title: 'Hi',
        body: 'Body',
        imageUrl: 'https://example.com/x.png',
        style: IamBodyStyle(closeButtonBackgroundColor: '#ff112233'),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IamBody(
              content: content,
              onPrimaryCta: () {},
              onSecondaryCta: () {},
              onClose: () {},
            ),
          ),
        ),
      );

      final materialFinder = find.ancestor(
        of: find.byIcon(Icons.close),
        matching: find.byWidgetPredicate(
          (Widget w) =>
              w is Material &&
              w.shape is CircleBorder &&
              w.color?.toARGB32() == 0xFF112233,
        ),
      );
      expect(materialFinder, findsOneWidget);
    },
  );
}
