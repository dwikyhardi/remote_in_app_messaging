## Unreleased

### 0.1.1
- `IamBody` now renders the image slot through `buildIamImage`, gaining native support for asset paths, `http(s)` URLs and `.svg` (raster + vector) — previously it only handled `Image.network`. Behavior for `imageUrl` pointing at a network raster image is unchanged; `imageBuilder` and `imageErrorBuilder` overrides are still honored.
- `buildIamImage` exposes an optional `errorBuilder` parameter (raster paths only); SVG rendering and existing call sites are unaffected.

## 0.1.0 — 2026-05-08

### Added
- `IamService` singleton with `init`, `onAppLaunch`, `onRoute`, `onEvent` and refresh hooks.
- `IamHostBindings` abstract host contract for remote payload, analytics, navigation, external URLs, logging and `isEnabled` kill switch.
- JSON schema `version: 1` with `messages[]`, `trigger`, `targeting`, `frequency`, `schedule` and weighted `variants[]`.
- Layouts: `modal`, `bottom_sheet`, `fullscreen`, `image_only_modal`.
- Triggers: `on_launch`, `on_route`, `on_event` (param matching, optional delay).
- Targeting: platform, env, app-version semver range, orgs, roles, allow/deny user ids.
- A/B variants: weighted random, sticky per user + message.
- Frequency: `maxImpressions` + `dismissBehavior` (`do_not_show_again` / `allow_retry`).
- Schedule windows: `startAt` / `endAt` (ISO-8601 UTC).
- CTA actions: `close`, `deep_link`, `external_url`.
- Tolerant JSON parser: unknown fields ignored, malformed entries skipped via `IamHostBindings.logError`.
- JSON styling for body and CTA via `IamBodyStyle` / `IamCtaButtonStyle`.
- JSON style primitives: `IamEdgeInsets`, `IamSize`, `IamBorderRadius`, `IamBorderSide`, `IamAlignment`, `IamTextStyle`.
- `parseIamColor` accepts `#rrggbb` and `#aarrggbb` (leading `#` optional).
- Style precedence: widget ctor arg > JSON `style` > built-in default.
- Eligibility + selection engine (`InAppMessagingEngine`).
- Trigger orchestration (`InAppMessagingCoordinator`).
- Per-message state persistence via `IamStateStore` + `HiveIamStateStore` (`hive_ce`).
- Semver range checks for app-version targeting.
- Modal, bottom sheet and fullscreen renderers on shared `IamRenderer` with `IamBody` and `IamCtaButton`.
- Runnable example under `example/` covering local JSON, simulated Remote Config refresh, all triggers, targeting/frequency edge cases and all layouts.
- `README.md` plus reference docs under `docs/` (quick start, triggers, schema, targeting, styling, API).
