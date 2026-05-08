# Maestro demo flow

End-to-end UI demo for the `remote_in_app_messaging` example app, designed to
be run with [Maestro](https://docs.maestro.dev/) and screen-recorded for
package documentation / pub.dev / release notes.

The flow exercises the entire public surface of the package in a single take:

| Section | Trigger | Layout / Action covered |
| --- | --- | --- |
| Welcome modal | `on_launch` | `modal` + `deep_link` + `close` |
| Promo unlocked (gold) | `on_event` w/ `eventParamsMatch` | `fullscreen` + `external_url` |
| Promo unlocked (silver) | `on_event` (params miss) | targeting negative path |
| Pro tip | `on_route` (`/details`) | `bottom_sheet` + `deep_link` |
| Layouts row | `on_event` × 4 | `modal` / `bottom_sheet` / `fullscreen` / `image_only_modal` |
| CTA actions row | `on_event` | `external_url` from `image_only_modal` |
| Targeting playground | `on_event` (`check_targeting`) | match + miss with env mutation |
| Remote Config | — | `invalidateCache` + payload swap |
| Global kill-switch | — | `IamHostBindings.isEnabled() == false` |
| Image-only preview | — | standalone `IamImage` widget |

## Files

```
example/maestro/
  flow.yaml           # iOS  entrypoint — appId: com.example.remoteInAppMessagingExample
  flow_android.yaml   # Android entrypoint — appId: com.example.remote_in_app_messaging_example
  _steps.yaml         # shared step list (do not run directly)
  README.md           # this file
```

`_steps.yaml` holds every action / assertion / screenshot. Maestro requires
every flow file (subflows included) to declare an `appId`, so `_steps.yaml`
uses `appId: ${APP_ID}` and each entrypoint forwards its platform-specific
bundle id via `runFlow.env.APP_ID`:

```yaml
# flow.yaml (iOS) — same shape in flow_android.yaml
appId: com.example.remoteInAppMessagingExample
---
- runFlow:
    file: _steps.yaml
    env:
      APP_ID: com.example.remoteInAppMessagingExample
```

That keeps the step list 100% shared between iOS and Android while still
satisfying Maestro's “Config Section Required” validation.

## Prerequisites

1. Maestro CLI installed:
   ```bash
   curl -Ls "https://get.maestro.mobile.dev" | bash
   maestro --version
   ```
2. A booted simulator/emulator. Verified working with the iOS simulator
   `iPhone 17 Pro - iOS 26.2` and Android emulators such as `Pixel_9`.
3. The example app installed on the device. From the repo root:
   ```bash
   cd example
   fvm flutter pub get
   fvm flutter run            # builds, installs, then leaves the app running
   ```
   You can stop `flutter run` once the app has been installed; Maestro will
   re-launch it (`launchApp` with `clearState: true, stopApp: true`) at the
   start of every flow.

## Run the flow (assertions only)

iOS:
```bash
maestro test example/maestro/flow.yaml
```

Android:
```bash
maestro test example/maestro/flow_android.yaml
```

Screenshots are saved next to `~/.maestro/tests/<run-id>/` (one per
`takeScreenshot` step, names prefixed `01_…` through `15_…`).

## Record the flow (video)

iOS:
```bash
maestro record example/maestro/flow.yaml
```

Android:
```bash
maestro record example/maestro/flow_android.yaml
```

`maestro record` produces a local `.mp4` plus an upload URL with timeline
annotations — that is the artifact to attach to release notes / pub.dev.

Tip: keep the simulator/emulator window visible at its native size while
recording so the captured video matches device aspect ratio.

## Targeting an explicit device

Maestro picks the first connected device by default. To pin a specific one:

```bash
maestro --device "iPhone 17 Pro" test   example/maestro/flow.yaml
maestro --device Pixel_9            record example/maestro/flow_android.yaml
```

List devices with `maestro --version` (boots) or `xcrun simctl list devices` /
`emulator -list-avds`.

## Troubleshooting

- **"App not installed"** — run `fvm flutter run` once on the target device
  before invoking Maestro; Maestro does not build Flutter apps for you.
- **Welcome modal does not appear** — the demo persists impressions via
  `hive_iam_state_store`; the flow uses `clearState: true` so impressions
  reset every run. If that is not enough (e.g. simulator with cached Hive
  files), uninstall the app from the device.
- **`tapOn: "modal"` matches the wrong button** — the `Layouts` section uses
  anchored regex (`^modal$`, `^bottom_sheet$`, …) to avoid colliding with
  substrings such as `image_only_modal`. Don't relax those without re-reading
  `example/lib/main.dart`.
- **Targeting miss flow fails** — the demo defaults `env=development`,
  `organizationId=acme`, `roles=[admin]`. The flow flips `env` to
  `production` to force the miss; if you've changed the defaults in
  `DemoUser`, update `_steps.yaml` accordingly.
- **Remote Config refresh snackbar invisible** — the snackbar duration is
  short; if `extendedWaitUntil` times out, increase its `timeout` in
  `_steps.yaml`.

## CI / mobile-mcp

The same files work with the
[`mobile-mcp`](https://github.com/mobile-next/mobile-mcp) and
[`maestro` MCP](https://docs.maestro.dev/get-started/maestro-mcp) servers
configured in `.junie/mcp/mcp.json`. An AI agent can run the flow end-to-end
by asking the maestro MCP server to execute `flow.yaml` /
`flow_android.yaml`; no additional configuration is required.
