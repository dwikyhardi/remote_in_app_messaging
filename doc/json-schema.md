# JSON schema

The package consumes a single JSON document — typically delivered through
Firebase Remote Config, a CDN, or a bundled asset. The parser is tolerant:
unknown fields are ignored and malformed entries are skipped via
`IamHostBindings.logError`.

## Minimum viable payload

```json
{
  "version": 1,
  "messages": [
    {
      "id": "promo_new_card_2025",
      "enabled": true,
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

## Full example

```json
{
  "version": 1,
  "messages": [
    {
      "id": "promo_new_card_2025",
      "enabled": true,
      "layout": "modal",
      "showCloseButton": true,
      "startAt": "2025-01-01T00:00:00Z",
      "endAt":   "2025-12-31T23:59:59Z",
      "trigger": {
        "type": "on_launch",
        "routePath": "/home",
        "eventName": "card_activated",
        "eventParamsMatch": { "status": "success" },
        "delayMs": 0
      },
      "targeting": {
        "platforms": ["android", "ios"],
        "envs": ["production", "development"],
        "minAppVersion": "1.13.0",
        "maxAppVersion": null,
        "organizations": [],
        "excludeOrganizations": [],
        "roles": [],
        "allowUserIds": [],
        "denyUserIds": []
      },
      "frequency": {
        "maxImpressions": 3,
        "dismissBehavior": "do_not_show_again"
      },
      "variants": [
        {
          "weight": 50,
          "content": {
            "title": "Your new card is ready",
            "body":  "Activate it now to start spending.",
            "imageUrl": "https://example.com/iam/card_promo.png",
            "backgroundColor": "#FFFFFF",
            "textColor": "#111111",
            "primaryCta":   { "label": "Activate", "action": "deep_link", "url": "/card" },
            "secondaryCta": { "label": "Later",    "action": "close" }
          }
        }
      ]
    }
  ]
}
```

## Enums

| Field                        | Values                                                       |
|------------------------------|--------------------------------------------------------------|
| `layout`                     | `modal` · `bottom_sheet` · `fullscreen` · `image_only_modal` |
| `trigger.type`               | `on_launch` · `on_route` · `on_event`                        |
| `frequency.dismissBehavior`  | `do_not_show_again` · `allow_retry`                          |
| CTA `action`                 | `close` · `deep_link` · `external_url`                       |

## Notable optional fields

- **`showCloseButton`** (`bool`, default `true`) — hides the top-right ×
  icon on every variant of the message when set to `false`. Controlled
  **per message** (not per variant), so all A/B variants behave the same.
  - Safe on `bottom_sheet` (drag handle / barrier tap still dismiss) and on
    `modal` with the default `barrierDismissible: true`.
  - Avoid on `fullscreen` unless you also provide a CTA with
    `action: "close"` — otherwise the user has no way out of the takeover.

## `image_only_modal` layout

A pure-creative modal that renders just `content.imageUrl` plus a
translucent overlay close button in the top-right corner. There is no
title, body, or CTA column — the image *is* the message.

- The image is sized `BoxFit.contain` and capped at ~70% of the screen
  height, with rounded corners. The fit, height and width can be
  overridden from JSON via `content.style.imageFit`,
  `content.style.imageHeight` and `content.style.imageWidth` (the 70%
  height cap still applies).
- Source detection is automatic: an `http(s)://` URL routes through
  `Image.network` / `SvgPicture.network`, anything else is treated as an
  asset (must be registered in the host's `pubspec.yaml`).
- Format detection is automatic: `.svg` (case-insensitive) renders via
  `flutter_svg`; `.png` / `.jpg` / `.jpeg` / `.webp` / `.gif` / `.bmp`
  render via the raster `Image` widget. `.webm` is **not** supported (it
  is a video container).
- Tapping the image fires `primaryCta` when present; otherwise the image
  is decorative and only the close button, the barrier, or the system
  back gesture dismisses.
- A null / empty `imageUrl` resolves synchronously to dismissed without
  ever opening a dialog, so a misconfigured campaign cannot wedge the
  queue.

```json
{
  "id": "promo_image_only",
  "layout": "image_only_modal",
  "trigger": { "type": "on_event", "eventName": "show_image_modal" },
  "variants": [
    {
      "weight": 100,
      "content": {
        "imageUrl": "assets/parrot.jpg",
        "primaryCta": { "label": "Open", "action": "deep_link", "url": "/details" }
      }
    }
  ]
}
```

## See also

- [Targeting, frequency & schedule](targeting-and-frequency.md)
- [Styling via JSON](styling.md)
