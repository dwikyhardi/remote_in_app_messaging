// Example app for the remote_in_app_messaging package.
//
// Demonstrates:
//  - Local JSON payload (bundled as an asset).
//  - Simulated Remote Config refresh (swap payload + invalidate cache).
//  - Route triggers via a NavigatorObserver.
//  - Event triggers via IamService.onEvent.
//  - Targeting playground (platform / env / organization / role / appVersion).

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:remote_in_app_messaging/remote_in_app_messaging.dart';

void main() {
  runApp(const ExampleApp());
}

/// Simulated Remote Config store. In a real host you'd read this from
/// `FirebaseRemoteConfig.getString(...)`.
class FakeRemoteConfig {
  FakeRemoteConfig._(this.payload);

  static FakeRemoteConfig? _instance;

  String payload;

  static Future<FakeRemoteConfig> load() async {
    final initial = await rootBundle.loadString(
      'assets/remote_messages.json',
    );
    return _instance ??= FakeRemoteConfig._(initial);
  }

  static FakeRemoteConfig get instance {
    assert(_instance != null, 'FakeRemoteConfig.load() was not called');
    return _instance!;
  }
}

/// Mutable user context used by [DemoIamHostBindings]. The demo UI edits this
/// and then triggers a refresh to see how targeting responds.
class DemoUser extends ChangeNotifier {
  String userId = 'user-1';
  String platform = defaultTargetPlatform == TargetPlatform.iOS
      ? 'ios'
      : 'android';
  String env = 'development';
  String appVersion = '1.0.0';
  String? organizationId = 'acme';
  List<String> roles = <String>['admin'];
  bool enabled = true;

  IamUserContext snapshot() => IamUserContext(
    userId: userId,
    platform: platform,
    env: env,
    appVersion: appVersion,
    organizationId: organizationId,
    roles: List<String>.unmodifiable(roles),
  );

  void update(VoidCallback mutate) {
    mutate();
    notifyListeners();
  }
}

/// Example host bindings wiring analytics to `debugPrint`, deep-links to the
/// in-app [Navigator], and external URLs to a harmless no-op (this example
/// intentionally does not depend on `url_launcher`).
class DemoIamHostBindings extends IamHostBindings {
  DemoIamHostBindings({
    required this.navigatorKey,
    required this.user,
    required this.remoteConfig,
  });

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final DemoUser user;
  final FakeRemoteConfig remoteConfig;

  @override
  bool isEnabled() => user.enabled;

  @override
  IamUserContext currentUser() => user.snapshot();

  @override
  Future<String> loadMessagesJson() async => remoteConfig.payload;

  @override
  Future<bool> openDeepLink(String url) async {
    final nav = navigatorKey.currentState;
    if (nav == null) return false;
    await nav.pushNamed(url);
    return true;
  }

  @override
  Future<bool> openExternalUrl(String url) async {
    debugPrint('[iam] openExternalUrl($url) — demo no-op');
    return true;
  }

  @override
  void trackEvent(String name, Map<String, dynamic> params) {
    debugPrint('[iam] track $name $params');
  }

  @override
  void logInfo(String message, {Map<String, Object?>? data}) {
    debugPrint('[iam][info] $message ${data ?? ''}');
  }

  @override
  void logError(Object error, [StackTrace? stackTrace, String? context]) {
    debugPrint('[iam][error] ${context ?? ''} $error');
  }
}

/// Forwards `didPush` / `didReplace` route names to IamService so that
/// `on_route` triggers fire automatically.
class IamNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _dispatch(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) _dispatch(newRoute);
  }

  void _dispatch(Route<dynamic> route) {
    final name = route.settings.name;
    if (name == null || name.isEmpty) return;
    IamService.instance?.onRoute(name);
  }
}

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
final DemoUser _user = DemoUser();

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  late final Future<void> _bootstrap = _init();

  Future<void> _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    final rc = await FakeRemoteConfig.load();
    IamService.init(
      DemoIamHostBindings(
        navigatorKey: _navigatorKey,
        user: _user,
        remoteConfig: rc,
      ),
    );
    // Fire the launch trigger once the navigator is ready.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      IamService.instance?.onAppLaunch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _bootstrap,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }
        return MaterialApp(
          title: 'remote_in_app_messaging example',
          debugShowCheckedModeBanner: false,
          navigatorKey: _navigatorKey,
          navigatorObservers: <NavigatorObserver>[IamNavigatorObserver()],
          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            '/': (_) => HomePage(user: _user),
            '/details': (_) => const DetailsPage(),
          },
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({required this.user, super.key});

  final DemoUser user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _pocImagePath = 'assets/parrot.jpg';

  @override
  void initState() {
    super.initState();
    widget.user.addListener(_onUserChanged);
  }

  @override
  void dispose() {
    widget.user.removeListener(_onUserChanged);
    super.dispose();
  }

  void _onUserChanged() => setState(() {});

  Future<void> _refreshRemoteConfig() async {
    // Simulate a Remote Config activate by toggling a variant's title.
    final flip = FakeRemoteConfig.instance.payload.contains('Welcome 👋');
    final swapped = FakeRemoteConfig.instance.payload.replaceAll(
      flip ? 'Welcome 👋 (variant A)' : 'Welcome from Remote Config',
      flip ? 'Welcome from Remote Config' : 'Welcome 👋 (variant A)',
    );
    FakeRemoteConfig.instance.payload = swapped;
    IamService.instance?.invalidateCache();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Remote Config refreshed & cache invalidated'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final u = widget.user;
    return Scaffold(
      appBar: AppBar(title: const Text('remote_in_app_messaging demo')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          const _SectionTitle('Triggers'),
          const _HelperText(
            'Covers all 3 IamTriggerType values: '
            'on_launch, on_route, on_event.',
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () => IamService.instance?.onAppLaunch(),
                icon: const Icon(Icons.flight_takeoff),
                label: const Text('on_launch (welcome_modal)'),
              ),
              ElevatedButton.icon(
                onPressed: () => Navigator.of(context).pushNamed('/details'),
                icon: const Icon(Icons.alt_route),
                label: const Text('on_route → push /details'),
              ),
              ElevatedButton.icon(
                onPressed: () => IamService.instance?.onEvent(
                  'promo_unlocked',
                  <String, dynamic>{'tier': 'gold'},
                ),
                icon: const Icon(Icons.bolt),
                label: const Text(
                  'on_event promo_unlocked {tier: gold}',
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => IamService.instance?.onEvent(
                  'promo_unlocked',
                  <String, dynamic>{'tier': 'silver'},
                ),
                icon: const Icon(Icons.block),
                label: const Text(
                  'on_event {tier: silver} (params miss)',
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const _SectionTitle('Layouts'),
          const _HelperText(
            'Covers all 4 IamLayout values: modal, bottom_sheet, fullscreen, '
            'image_only_modal. Each button fires the event trigger that '
            'shows a message of that layout.',
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () => IamService.instance?.onEvent('show_modal'),
                icon: const Icon(Icons.crop_square),
                label: const Text('modal'),
              ),
              ElevatedButton.icon(
                onPressed: () =>
                    IamService.instance?.onEvent('show_bottom_sheet'),
                icon: const Icon(Icons.vertical_align_bottom),
                label: const Text('bottom_sheet'),
              ),
              ElevatedButton.icon(
                onPressed: () =>
                    IamService.instance?.onEvent('show_fullscreen'),
                icon: const Icon(Icons.fullscreen),
                label: const Text('fullscreen'),
              ),
              ElevatedButton.icon(
                onPressed: () =>
                    IamService.instance?.onEvent('show_image_modal'),
                icon: const Icon(Icons.image_outlined),
                label: const Text('image_only_modal'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const _SectionTitle('CTA actions'),
          const _HelperText(
            'Covers all 3 IamActionType values: close, deep_link, '
            'external_url. Tap a button to surface a message whose primary '
            'CTA performs that action. Watch the debug console for analytics '
            'and external_url logs.',
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () => IamService.instance?.onEvent('show_modal'),
                icon: const Icon(Icons.open_in_browser),
                label: const Text('external_url (modal)'),
              ),
              ElevatedButton.icon(
                onPressed: () =>
                    IamService.instance?.onEvent('show_fullscreen'),
                icon: const Icon(Icons.link),
                label: const Text('deep_link (fullscreen)'),
              ),
              ElevatedButton.icon(
                onPressed: () =>
                    IamService.instance?.onEvent('show_image_modal_external'),
                icon: const Icon(Icons.public),
                label: const Text('external_url (image_only)'),
              ),
              ElevatedButton.icon(
                onPressed: () =>
                    IamService.instance?.onEvent('check_targeting'),
                icon: const Icon(Icons.close),
                label: const Text('close (targeted bottom_sheet)'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const _SectionTitle('Remote Config'),
          ElevatedButton.icon(
            onPressed: _refreshRemoteConfig,
            icon: const Icon(Icons.refresh),
            label: const Text('Refresh & invalidate cache'),
          ),
          Semantics(
            identifier: 'global_kill_switch',
            explicitChildNodes: true,
            child: Row(
              children: [
                Semantics(
                  identifier: 'global_kill_switch_toggle',
                  child: Switch(
                    value: u.enabled,
                    onChanged: (bool v) => u.update(() => u.enabled = v),
                  ),
                ),
                const SizedBox(width: 12),
                const Text('Global kill-switch'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const _SectionTitle('Targeting playground'),
          _LabeledDropdown<String>(
            label: 'platform',
            value: u.platform,
            items: const <String>['android', 'ios', 'web'],
            onChanged: (String v) => u.update(() => u.platform = v),
          ),
          _LabeledDropdown<String>(
            label: 'env',
            value: u.env,
            items: const <String>['development', 'production', 'staging'],
            onChanged: (String v) => u.update(() => u.env = v),
          ),
          _LabeledTextField(
            label: 'appVersion',
            value: u.appVersion,
            onChanged: (String v) => u.update(() => u.appVersion = v),
          ),
          _LabeledTextField(
            label: 'organizationId',
            value: u.organizationId ?? '',
            onChanged: (String v) =>
                u.update(() => u.organizationId = v.isEmpty ? null : v),
          ),
          _LabeledTextField(
            label: 'roles (comma separated)',
            value: u.roles.join(','),
            onChanged: (String v) => u.update(
              () => u.roles = v
                  .split(',')
                  .map((String s) => s.trim())
                  .where((String s) => s.isNotEmpty)
                  .toList(),
            ),
          ),
          _LabeledTextField(
            label: 'userId',
            value: u.userId,
            onChanged: (String v) => u.update(() => u.userId = v),
          ),
          const SizedBox(height: 24),
          const _SectionTitle('Image-only modal'),
          _LabeledTextField(
            label: 'image path / url',
            value: _pocImagePath,
            onChanged: (String v) => setState(() => _pocImagePath = v),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: OutlinedButton.icon(
              onPressed: () => _previewIamImage(context, _pocImagePath),
              icon: const Icon(Icons.preview_outlined),
              label: const Text('Preview IamImage in a Dialog'),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Tip: launch messages fire on app start. Use the buttons above to '
            'fire route & event triggers. Edit targeting fields and re-fire '
            'events to see targeting decisions in action.',
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

/// Renders [path] inside a transparent dialog using the published `IamImage`,
/// purely for QA convenience. This bypasses the engine and is unrelated to
/// the campaign flow.
Future<void> _previewIamImage(BuildContext context, String path) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext ctx) {
      final maxImageHeight = MediaQuery.of(ctx).size.height * 0.7;
      return Dialog(
        insetPadding: const EdgeInsets.all(24),
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxImageHeight),
            child: IamImage(path: path),
          ),
        ),
      );
    },
  );
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Pushing this route fires `on_route` with path "/details".\n'
            'The package should show the "Pro tip" bottom sheet.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

/// Small grey helper paragraph rendered under a [_SectionTitle].
class _HelperText extends StatelessWidget {
  const _HelperText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black54, fontSize: 12),
      ),
    );
  }
}

class _LabeledDropdown<T> extends StatelessWidget {
  const _LabeledDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label;
  final T value;
  final List<T> items;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
          SizedBox(width: 160, child: Text(label)),
          DropdownButton<T>(
            value: value,
            items: items
                .map((T e) => DropdownMenuItem<T>(value: e, child: Text('$e')))
                .toList(),
            onChanged: (T? v) {
              if (v != null) onChanged(v);
            },
          ),
        ],
      ),
    );
  }
}

class _LabeledTextField extends StatefulWidget {
  const _LabeledTextField({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  State<_LabeledTextField> createState() => _LabeledTextFieldState();
}

class _LabeledTextFieldState extends State<_LabeledTextField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.value,
  );

  @override
  void didUpdateWidget(covariant _LabeledTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
          SizedBox(width: 160, child: Text(widget.label)),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(isDense: true),
              onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
