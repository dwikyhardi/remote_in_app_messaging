# remote_in_app_messaging

> Host-agnostic, JSON-driven **in-app messaging** for Flutter.
> Drive **modal**, **bottom sheet** and **fullscreen** messages from a remote
> payload (e.g. Firebase Remote Config) — with targeting, A/B variants,
> frequency caps and full visual styling from JSON.
>
> Intentionally independent of `firebase_in_app_messaging`.

[![pub package](https://img.shields.io/pub/v/remote_in_app_messaging.svg)](https://pub.dev/packages/remote_in_app_messaging)

---

## TL;DR

1. Host loads a JSON payload (from Remote Config, a CDN, a file, …).
2. Package parses it, decides **what to show / when / to whom**.
3. Package renders a **modal / bottom sheet / fullscreen** message.
4. Host handles side-effects (analytics, deep links, URLs, logs) via a single
   `IamHostBindings` contract.

```text
 ┌────────┐  JSON   ┌──────────────────────────┐  show()   ┌─────────┐
 │  Host  │ ──────▶ │ remote_in_app_messaging  │ ────────▶ │  User   │
 └────────┘         │  parse → target → render │           └─────────┘
      ▲             └──────────────────────────┘
      │  analytics / deep links / logs  (IamHostBindings)
      └────────────────────────────────────────────────
```

## Why this package

- **Host-agnostic.** Zero dependency on Firebase, analytics, or navigation
  libraries in `lib/`. Plug in whatever you already have.
- **JSON-driven end-to-end.** Content **and** visuals (colors, paddings,
  text styles, CTA shapes, …) can be changed remotely without shipping a
  new build.
- **Tolerant parser.** Unknown fields are ignored; malformed entries are
  skipped and logged via `IamHostBindings.logError`.
- **Backward compatible by design.** Adding a field is always optional with
  a safe default. Widget-level args always win over JSON.

## Features

| Category          | Supported                                                                  |
|-------------------|----------------------------------------------------------------------------|
| Layouts           | `modal`, `bottom_sheet`, `fullscreen`, `image_only_modal`                  |
| Triggers          | `on_launch`, `on_route`, `on_event` (with param matching + optional delay) |
| Targeting         | Platform · env · app-version range · orgs · roles · allow / deny user ids  |
| A/B               | Weighted random variants, **sticky per user + message**                    |
| Frequency         | `maxImpressions` + `dismissBehavior` (`do_not_show_again` / `allow_retry`) |
| Schedule          | `startAt` / `endAt` (ISO-8601, UTC)                                        |
| CTA actions       | `close`, `deep_link`, `external_url`                                       |
| Styling           | Full `IamBody` + `IamCtaButton` styling from JSON                          |
| Kill switch       | `IamHostBindings.isEnabled`                                                |

## Install

```yaml
dependencies:
  remote_in_app_messaging: ^0.1.0
```

Requirements: **Flutter ≥ 3.29**, **Dart ^3.8**.

## Quick taste

A minimal setup looks like this — see the [Quick start](docs/quick-start.md)
for the full walkthrough.

```dart
IamService.init(MyIamHostBindings(remoteConfig, analytics, navKey));

// Run the engine on app start, route changes and analytics events:
await IamService.instance?.onAppLaunch();
IamService.instance?.onRoute('/home');
IamService.instance?.onEvent('card_activated', {'status': 'success'});
```

And the smallest useful payload:

```json
{
  "version": 1,
  "messages": [
    {
      "id": "promo_new_card_2025",
      "layout": "modal",
      "trigger": { "type": "on_launch" },
      "variants": [
        {
          "weight": 100,
          "content": {
            "title": "Your new card is ready",
            "body":  "Activate it now to start spending.",
            "primaryCta":   { "label": "Activate", "action": "deep_link", "url": "/card" },
            "secondaryCta": { "label": "Later",    "action": "close" }
          }
        }
      ]
    }
  ]
}
```

## Documentation

Full reference docs live under [`docs/`](./docs):

- [Quick start (5 minutes)](docs/quick-start.md) — implement
  `IamHostBindings`, initialize `IamService`, wire triggers.
- [Triggers](docs/triggers.md) — `onAppLaunch` / `onRoute` / `onEvent` and
  where to call them from.
- [JSON schema](docs/json-schema.md) — minimum and full payload, layouts
  (including `image_only_modal`), enums, optional fields.
- [Targeting, frequency & schedule](docs/targeting-and-frequency.md) —
  audience filters, rate limits, time windows, and CTA actions.
- [Styling via JSON](docs/styling.md) — `IamBodyStyle` /
  `IamCtaButtonStyle` fields, JSON style primitives, enum values,
  precedence rules.
- [Public API](docs/api.md) — `IamService` surface and the full
  `IamHostBindings` contract.

## Demo

A 1-minute walkthrough of the package in action:

[![Watch the demo on YouTube](https://img.youtube.com/vi/WpuLo9xHrmo/hqdefault.jpg)](https://youtube.com/shorts/WpuLo9xHrmo)

> ▶︎ <https://youtube.com/shorts/WpuLo9xHrmo>

## Example app

The [`example/`](./example) directory contains a runnable demo covering:

- local JSON payload,
- simulated Remote Config refresh,
- route & event triggers,
- targeting + frequency edge cases,
- all three layouts with styled variants.

```bash
cd example
fvm flutter run
```

## Status

Published on [pub.dev](https://pub.dev/packages/remote_in_app_messaging).
Backward-compatible by policy: new fields are always optional with a safe
default — existing JSON keeps working across versions.
