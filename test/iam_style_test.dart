import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remote_in_app_messaging/remote_in_app_messaging.dart';

void main() {
  group('IamBodyStyle / IamCtaButtonStyle JSON round-trip', () {
    test('IamContent decodes a full style payload', () {
      final json = <String, dynamic>{
        'title': 'Hi',
        'body': 'Body',
        'backgroundColor': '#112233',
        'textColor': '#ffffff',
        'primaryCta': {
          'label': 'Go',
          'action': 'deep_link',
          'url': '/x',
          'style': {
            'backgroundColor': '#ff0000',
            'foregroundColor': '#00ff00',
            'overlayColor': '#0000ff',
            'padding': {'horizontal': 16, 'vertical': 8},
            'minimumSize': {'height': 48},
            'borderRadius': {'all': 12},
            'border': {'color': '#abcdef', 'width': 2},
            'elevation': 3,
            'textStyle': {
              'color': '#ffffff',
              'fontSize': 14,
              'fontWeight': 'w600',
            },
            'iconAlignment': 'end',
            'enabled': true,
          },
        },
        'secondaryCta': {'label': 'No', 'action': 'close'},
        'style': {
          'padding': {'all': 24},
          'imageBottomSpacing': 20,
          'titleBottomSpacing': 12,
          'bodyBottomSpacing': 20,
          'primaryCtaBottomSpacing': 12,
          'crossAxisAlignment': 'center',
          'textAlign': 'left',
          'scrollable': true,
          'backgroundColor': '#222222',
          'titleStyle': {'fontSize': 22, 'fontWeight': 'bold'},
          'bodyStyle': {'fontSize': 16},
          'imageFit': 'contain',
          'imageHeight': 180,
          'imageWidth': 240,
          'imageBorderRadius': {'topLeft': 8, 'topRight': 8},
          'showCloseButton': false,
          'closeIconColor': '#cccccc',
          'closeButtonAlignment': {'named': 'top_left'},
          'closeButtonTooltip': 'Dismiss',
          'ctaMinimumSize': {'height': 44},
          'ctaBorderRadius': {'all': 10},
          'primaryCtaStyle': {'backgroundColor': '#010101'},
          'secondaryCtaStyle': {'foregroundColor': '#020202'},
        },
      };

      final c = IamContent.fromJson(json);
      expect(c.title, 'Hi');
      expect(c.style, isNotNull);
      expect(c.style!.padding!.all, 24);
      expect(c.style!.titleStyle!.fontWeight, IamFontWeight.bold);
      expect(c.style!.imageFit, IamBoxFit.contain);
      expect(c.style!.imageHeight, 180);
      expect(c.style!.imageWidth, 240);
      expect(c.style!.crossAxisAlignment, IamCrossAxisAlignment.center);
      expect(c.style!.textAlign, IamTextAlign.left);
      expect(c.style!.closeButtonAlignment!.named,
          IamNamedAlignment.topLeft);
      expect(c.style!.showCloseButton, false);
      expect(c.style!.scrollable, true);

      expect(c.primaryCta!.style, isNotNull);
      expect(c.primaryCta!.style!.iconAlignment,
          IamCtaIconAlignmentJson.end);
      expect(c.primaryCta!.style!.border!.color, '#abcdef');
      expect(c.primaryCta!.style!.border!.width, 2);
      expect(c.primaryCta!.style!.textStyle!.fontWeight,
          IamFontWeight.w600);

      // Round-trip stability through a JSON string (matches how payloads
      // actually travel: `jsonEncode` flattens nested freezed `toJson`
      // outputs into plain maps).
      final back =
          jsonDecode(jsonEncode(c.toJson())) as Map<String, dynamic>;
      final c2 = IamContent.fromJson(back);
      expect(c2, c);
    });

    test('IamContent without style decodes into style == null '
        '(backward-compatible)', () {
      final c = IamContent.fromJson(<String, dynamic>{
        'title': 't',
        'body': 'b',
        'primaryCta': {'label': 'ok', 'action': 'close'},
      });
      expect(c.style, isNull);
      expect(c.primaryCta!.style, isNull);
    });
  });

  group('Flutter conversion extensions', () {
    test('IamEdgeInsets -> EdgeInsets variants', () {
      expect(
        const IamEdgeInsets(all: 8).toEdgeInsets(),
        const EdgeInsets.all(8),
      );
      expect(
        const IamEdgeInsets(horizontal: 10, vertical: 4).toEdgeInsets(),
        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      );
      expect(
        const IamEdgeInsets(left: 1, top: 2, right: 3, bottom: 4)
            .toEdgeInsets(),
        const EdgeInsets.only(left: 1, top: 2, right: 3, bottom: 4),
      );
    });

    test('IamBorderRadius -> BorderRadius', () {
      expect(
        const IamBorderRadius(all: 12).toBorderRadius(),
        BorderRadius.circular(12),
      );
      expect(
        const IamBorderRadius(topLeft: 4, bottomRight: 6).toBorderRadius(),
        const BorderRadius.only(
          topLeft: Radius.circular(4),
          bottomRight: Radius.circular(6),
        ),
      );
    });

    test('IamAlignment -> Alignment (named wins over x/y)', () {
      expect(
        const IamAlignment(named: IamNamedAlignment.bottomRight)
            .toAlignment(),
        Alignment.bottomRight,
      );
      expect(
        const IamAlignment(x: 0.5, y: -0.5).toAlignment(),
        const Alignment(0.5, -0.5),
      );
    });

    test('parseIamColor handles null / invalid / #rrggbb / #aarrggbb', () {
      expect(parseIamColor(null), isNull);
      expect(parseIamColor(''), isNull);
      expect(parseIamColor('not-a-color'), isNull);
      expect(parseIamColor('#ff0000')!.toARGB32(), 0xFFFF0000);
      expect(parseIamColor('#80ff0000')!.toARGB32(), 0x80FF0000);
    });

    test('IamFontWeight / IamFontStyle / IamBoxFit / IamCrossAxisAlignment '
        '/ IamTextAlign map correctly', () {
      expect(IamFontWeight.bold.toFontWeight(), FontWeight.w700);
      expect(IamFontWeight.normal.toFontWeight(), FontWeight.w400);
      expect(IamFontStyle.italic.toFontStyle(), FontStyle.italic);
      expect(IamBoxFit.cover.toBoxFit(), BoxFit.cover);
      expect(
        IamCrossAxisAlignment.stretch.toCrossAxisAlignment(),
        CrossAxisAlignment.stretch,
      );
      expect(IamTextAlign.justify.toTextAlign(), TextAlign.justify);
    });

    test('every IamFontWeight variant maps to a FontWeight', () {
      for (final v in IamFontWeight.values) {
        expect(v.toFontWeight, returnsNormally,
            reason: 'missing mapping for $v');
      }
    });

    test('every IamFontStyle variant maps to a FontStyle', () {
      for (final v in IamFontStyle.values) {
        expect(v.toFontStyle, returnsNormally,
            reason: 'missing mapping for $v');
      }
    });

    test('every IamBoxFit variant maps to a BoxFit', () {
      for (final v in IamBoxFit.values) {
        expect(v.toBoxFit, returnsNormally,
            reason: 'missing mapping for $v');
      }
    });

    test('every IamCrossAxisAlignment variant maps to a CrossAxisAlignment',
        () {
      for (final v in IamCrossAxisAlignment.values) {
        expect(v.toCrossAxisAlignment, returnsNormally,
            reason: 'missing mapping for $v');
      }
    });

    test('every IamTextAlign variant maps to a TextAlign', () {
      for (final v in IamTextAlign.values) {
        expect(v.toTextAlign, returnsNormally,
            reason: 'missing mapping for $v');
      }
    });

    test('every IamNamedAlignment variant maps to a Flutter Alignment', () {
      for (final v in IamNamedAlignment.values) {
        expect(
          IamAlignment(named: v).toAlignment(),
          isA<Alignment>(),
          reason: 'missing mapping for $v',
        );
      }
    });
  });

  group('resolveStyle', () {
    test('widget > json > fallback precedence', () {
      expect(resolveStyle<int>(1, 2, 3), 1);
      expect(resolveStyle<int>(null, 2, 3), 2);
      expect(resolveStyle<int>(null, null, 3), 3);
    });
  });

  group('IamBody honors JSON style defaults', () {
    testWidgets('uses content.style for background, title style, '
        'spacing and close tooltip', (tester) async {
      const content = IamContent(
        title: 'Title',
        body: 'Body',
        primaryCta: IamCta(label: 'Go'),
        style: IamBodyStyle(
          backgroundColor: '#112233',
          titleStyle: IamTextStyle(fontSize: 30),
          padding: IamEdgeInsets(all: 32),
          closeButtonTooltip: 'ByeBye',
        ),
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
      expect(find.text('Title'), findsOneWidget);
      expect(find.byTooltip('ByeBye'), findsOneWidget);

      final titleWidget = tester.widget<Text>(find.text('Title'));
      expect(titleWidget.style?.fontSize, 30);
    });

    testWidgets('widget-level params still win over content.style',
        (tester) async {
      const content = IamContent(
        title: 'Title',
        body: 'Body',
        style: IamBodyStyle(closeButtonTooltip: 'FromJson'),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IamBody(
              content: content,
              onPrimaryCta: () {},
              onSecondaryCta: () {},
              onClose: () {},
              closeButtonTooltip: 'FromWidget',
            ),
          ),
        ),
      );
      expect(find.byTooltip('FromWidget'), findsOneWidget);
      expect(find.byTooltip('FromJson'), findsNothing);
    });
  });

  group('IamBody primary/secondary CTA symmetry', () {
    testWidgets('both CTAs render an IamCtaButton with the same minimumSize '
        'and borderRadius given symmetric input', (tester) async {
      const cta = IamCta(label: 'Tap');
      const content = IamContent(
        title: 'T',
        body: 'B',
        primaryCta: cta,
        secondaryCta: cta,
        style: IamBodyStyle(
          ctaMinimumSize: IamSize(height: 48),
          ctaBorderRadius: IamBorderRadius(all: 6),
        ),
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
      final buttons = tester
          .widgetList<IamCtaButton>(find.byType(IamCtaButton))
          .toList();
      expect(buttons, hasLength(2));
      expect(buttons[0].minimumSize, buttons[1].minimumSize);
      expect(buttons[0].borderRadius, buttons[1].borderRadius);
      expect(buttons[0].isPrimary, true);
      expect(buttons[1].isPrimary, false);
    });
  });

  group('IamCtaButton honors JSON style defaults', () {
    testWidgets('applies cta.style.backgroundColor when widget-level is '
        'unset', (tester) async {
      const cta = IamCta(
        label: 'Tap',
        style: IamCtaButtonStyle(
          backgroundColor: '#00ff00',
          minimumSize: IamSize(height: 60),
        ),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IamCtaButton(
              cta: cta,
              isPrimary: true,
              onPressed: () {},
            ),
          ),
        ),
      );
      final btn = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final style = btn.style!;
      final resolvedBg = style.backgroundColor!.resolve(<WidgetState>{});
      expect(resolvedBg!.toARGB32(), 0xFF00FF00);
    });
  });
}
