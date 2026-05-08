# remote_in_app_messaging_example

Runnable demo for the
[`remote_in_app_messaging`](../) package.

## What it shows

- **Local JSON payload** bundled as `assets/remote_messages.json`.
- **Simulated Remote Config refresh** — press _Refresh & invalidate cache_ to
  swap a payload string and call `IamService.invalidateCache()`.
- **Route triggers** — pushing `/details` fires an `on_route` trigger via
  `IamNavigatorObserver`.
- **Event triggers** — buttons call `IamService.onEvent(...)` with and without
  matching `eventParamsMatch`.
- **Targeting playground** — edit `platform`, `env`, `appVersion`,
  `organizationId` and `roles` at runtime to see targeting decisions.
- **Global kill-switch** — toggles `IamHostBindings.isEnabled`.

## Run

```bash
cd example
fvm flutter pub get
fvm flutter run
```

## Maestro demo flow

A scripted [Maestro](https://docs.maestro.dev/) walkthrough lives under
[`maestro/`](maestro/README.md). It exercises every layout, trigger and CTA
action for screen-recording purposes:

```bash
# iOS simulator
maestro test    example/maestro/flow.yaml
maestro record  example/maestro/flow.yaml

# Android emulator
maestro test    example/maestro/flow_android.yaml
maestro record  example/maestro/flow_android.yaml
```

See [`example/maestro/README.md`](maestro/README.md) for prerequisites and
troubleshooting.
