import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:remote_in_app_messaging/remote_in_app_messaging.dart';

// Keep image routes deterministic and offline, including asset lookup.
class _ImageBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) async {
    if (key == 'AssetManifest.bin') {
      return const StandardMessageCodec().encodeMessage(<String, Object>{})!;
    }
    return ByteData.sublistView(
      base64Decode(
        'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNk'
        '+A8AAQUBAScY42YAAAAASUVORK5CYII=',
      ),
    );
  }
}

const _primary = IamCta(
  label: 'Continue',
  action: IamActionType.deepLink,
  url: '/details',
);
const _secondary = IamCta(label: 'Later');
const _content = IamContent(
  title: 'Campaign',
  body: 'Message body',
  primaryCta: _primary,
  secondaryCta: _secondary,
);
const _imageContent = IamContent(
  imageUrl: 'campaign.png',
  primaryCta: _primary,
  style: IamBodyStyle(imageHeight: 160, imageWidth: 240),
);
const _renderers = <String, IamRenderer>{
  'modal': ModalIamRenderer(),
  'bottom sheet': BottomSheetIamRenderer(),
  'fullscreen': FullscreenIamRenderer(),
  'image-only modal': ImageOnlyModalIamRenderer(),
};

final _theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 29, color: Colors.orange),
    bodyMedium: TextStyle(fontSize: 17, color: Colors.brown),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.indigo),
  ),
);

Future<GlobalKey<NavigatorState>> _mountApp(
  WidgetTester tester, {
  TargetPlatform platform = TargetPlatform.android,
}) async {
  final key = GlobalKey<NavigatorState>();
  await tester.pumpWidget(
    DefaultAssetBundle(
      bundle: _ImageBundle(),
      child: MaterialApp(
        navigatorKey: key,
        theme: _theme.copyWith(platform: platform),
        locale: const Locale('id'),
        supportedLocales: const <Locale>[Locale('id')],
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        home: const Scaffold(body: Text('Host page')),
        routes: <String, WidgetBuilder>{
          '/details': (_) => const Scaffold(body: Text('Destination')),
        },
      ),
    ),
  );
  await tester.pumpAndSettle();
  await tester.runAsync(
    () => precacheImage(const AssetImage('campaign.png'), key.currentContext!),
  );
  return key;
}

void main() {
  for (final entry in _renderers.entries) {
    final isImage = entry.value is ImageOnlyModalIamRenderer;
    final content = isImage ? _imageContent : _content;

    testWidgets('${entry.key} inherits modern theme and localizations', (
      WidgetTester tester,
    ) async {
      final key = await _mountApp(tester);
      final result = entry.value.show(
        context: key.currentContext!,
        content: content,
      );
      await tester.pumpAndSettle();

      final close = find.byType(IconButton);
      final context = tester.element(close);
      expect(MaterialLocalizations.of(context).closeButtonTooltip, 'Tutup');
      expect(tester.widget<IconButton>(close).tooltip, 'Tutup');
      expect(Theme.of(context).colorScheme, _theme.colorScheme);
      if (!isImage) {
        final title = tester.widget<Text>(find.text('Campaign')).style!;
        expect(title.fontSize, 29);
        expect(title.color, Colors.orange);
        final body = tester.widget<Text>(find.text('Message body')).style!;
        expect(body.fontSize, 17);
        expect(body.color, Colors.brown);
        final primaryMaterial = tester.widget<Material>(
          find.descendant(
            of: find.byType(ElevatedButton),
            matching: find.byType(Material),
          ),
        );
        expect(primaryMaterial.color, Colors.teal);
        final primaryLabel = tester.element(find.text('Continue'));
        expect(
          DefaultTextStyle.of(primaryLabel).style.color,
          Colors.white,
        );
        expect(
          DefaultTextStyle.of(tester.element(find.text('Later'))).style.color,
          Colors.indigo,
        );
      }

      await tester.tap(close);
      await tester.pumpAndSettle();
      expect((await result).outcome, IamRenderOutcome.dismissed);
      expect(find.text('Host page'), findsOneWidget);
      expect(key.currentState!.canPop(), isFalse);
      expect(tester.takeException(), isNull);
    });

    testWidgets('${entry.key} returns CTA before host navigation', (
      WidgetTester tester,
    ) async {
      final key = await _mountApp(tester);
      final result = entry.value.show(
        context: key.currentContext!,
        content: content,
      );
      await tester.pumpAndSettle();
      await tester.tap(isImage ? find.byType(IamImage) : find.text('Continue'));
      await tester.pumpAndSettle();

      final resolved = await result;
      expect(resolved.outcome, IamRenderOutcome.ctaTapped);
      expect(resolved.cta, same(_primary));
      expect(key.currentState!.canPop(), isFalse);
      final navigation = key.currentState!.pushNamed<void>(resolved.cta!.url!);
      await tester.pumpAndSettle();
      expect(find.text('Destination'), findsOneWidget);
      key.currentState!.pop();
      await tester.pumpAndSettle();
      await navigation;
      expect(tester.takeException(), isNull);
    });

    testWidgets('${entry.key} treats system back as dismissal', (
      WidgetTester tester,
    ) async {
      final key = await _mountApp(tester);
      final result = entry.value.show(
        context: key.currentContext!,
        content: content,
      );
      await tester.pumpAndSettle();
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect((await result).outcome, IamRenderOutcome.dismissed);
      expect(key.currentState!.canPop(), isFalse);
    });

    if (!isImage) {
      testWidgets('${entry.key} returns the secondary close CTA', (
        WidgetTester tester,
      ) async {
        final key = await _mountApp(tester);
        final result = entry.value.show(
          context: key.currentContext!,
          content: content,
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('Later'));
        await tester.pumpAndSettle();
        final resolved = await result;
        expect(resolved.outcome, IamRenderOutcome.ctaTapped);
        expect(resolved.cta, same(_secondary));
        expect(key.currentState!.canPop(), isFalse);
      });
    }

    if (entry.value is! FullscreenIamRenderer) {
      testWidgets('${entry.key} localizes barrier and returns dismissal', (
        WidgetTester tester,
      ) async {
        final key = await _mountApp(tester);
        final result = entry.value.show(
          context: key.currentContext!,
          content: content,
        );
        await tester.pumpAndSettle();
        final barriers = tester.widgetList<ModalBarrier>(
          find.byType(ModalBarrier),
        );
        final localizations = MaterialLocalizations.of(key.currentContext!);
        final barrier = barriers.where((barrier) => barrier.dismissible).single;
        expect(
          barrier.semanticsLabel,
          entry.value is BottomSheetIamRenderer
              ? localizations.scrimLabel
              : localizations.modalBarrierDismissLabel,
        );
        await tester.tapAt(const Offset(5, 5));
        await tester.pumpAndSettle();
        expect((await result).outcome, IamRenderOutcome.dismissed);
        expect(key.currentState!.canPop(), isFalse);
      });
    }
  }

  testWidgets('fullscreen uses modern Cupertino transitions on iOS', (
    WidgetTester tester,
  ) async {
    final key = await _mountApp(tester, platform: TargetPlatform.iOS);
    final result = const FullscreenIamRenderer().show(
      context: key.currentContext!,
      content: _content,
    );
    await tester.pumpAndSettle();
    expect(find.byTooltip('Tutup'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect((await result).cta, same(_primary));
    expect(key.currentState!.canPop(), isFalse);
    expect(tester.takeException(), isNull);
  });

  testWidgets('modern ButtonStyle overrides JSON and host CTA themes', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: _theme,
        home: Scaffold(
          body: IamBody(
            content: const IamContent(
              primaryCta: IamCta(
                label: 'Primary',
                style: IamCtaButtonStyle(backgroundColor: '#00ff00'),
              ),
              secondaryCta: IamCta(
                label: 'Secondary',
                style: IamCtaButtonStyle(foregroundColor: '#0000ff'),
              ),
            ),
            primaryCtaStyle: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
            ),
            secondaryCtaStyle: TextButton.styleFrom(
              foregroundColor: Colors.pink,
            ),
            onPrimaryCta: () {},
            onSecondaryCta: () {},
            onClose: () {},
          ),
        ),
      ),
    );
    final primaryMaterial = tester.widget<Material>(
      find.descendant(
        of: find.byType(ElevatedButton),
        matching: find.byType(Material),
      ),
    );
    expect(primaryMaterial.color, Colors.amber);
    expect(
      DefaultTextStyle.of(tester.element(find.text('Primary'))).style.color,
      Colors.black,
    );
    expect(
      DefaultTextStyle.of(tester.element(find.text('Secondary'))).style.color,
      Colors.pink,
    );
  });
}
