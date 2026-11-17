# SDK integration

Version `0.2.0` uses `material_ui: ^1.11.1` and
`cupertino_ui: ^1.1.7`, with Flutter >=3.47 and Dart >=3.13.
When upgrading from `0.1.1`, update the host's public Material styling arguments
to use the extracted UI types.

Import `package:material_ui/material_ui.dart` in the host for `MaterialApp`,
`ThemeData`, `ButtonStyle`, and Material widgets passed to IAM. Public Material
parameters such as `IamBody.primaryCtaStyle` and `IamCtaButton.primaryStyle`
now use the extracted library's types. Core Flutter types (`BuildContext`,
`NavigatorState`, widget builders, and image error callbacks) are unchanged.
There is no direct Cupertino widget usage; the explicit `cupertino_ui`
constraint keeps Material's adaptive routes on the current Cupertino library.

All four renderers inherit the modern app theme and localizations without
`MaterialUiCompatibilityBridge`. For non-English apps, use the extracted
localization delegates:

```dart
import 'package:material_ui/material_ui.dart';

MaterialApp(
  localizationsDelegates: GlobalMaterialLocalizations.delegates,
  supportedLocales: const [Locale('en'), Locale('id')],
  // theme, navigatorKey, home, ...
);
```

Default close tooltips use the app locale; widget and JSON tooltip overrides
still take precedence. JSON payloads, CTA results, and host navigation bindings
are unchanged. Run `fvm flutter pub get` in the host after adding a path override.
