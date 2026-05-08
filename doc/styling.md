# Styling via JSON

Every layout, spacing, color, text and shape parameter of `IamBody` and
`IamCtaButton` can be driven from the remote payload. This lets the host
redesign a campaign's look — colors, fonts, paddings, radii, image fit,
close-button placement, CTA shapes — **without shipping a new app build**.

Two optional fields carry the styling:

- `variants[].content.style` → **`IamBodyStyle`**
  Controls the overall body layout (padding, spacings, alignment, background,
  close button, title / body text styles, image rendering, default CTA
  sizing).
- `variants[].content.primaryCta.style`,
  `variants[].content.secondaryCta.style` → **`IamCtaButtonStyle`**
  Controls the per-CTA look (colors, text style, padding, min size, border
  radius, border, elevation, icon alignment, enabled flag).

## Precedence (do not break)

For every parameter, the package resolves the value in this order:

1. **Widget-level constructor argument** on `IamBody` / `IamCtaButton` (host
   code).
2. **JSON** value from `content.style` / `cta.style`.
3. **Built-in default** (matches the pre-styling behavior).

So JSON is a **default** that the host can still override from Dart, and
omitting `style` entirely keeps the existing visual output — the whole
feature is fully backward compatible.

## Example — a fully styled variant

```json
{
  "variants": [
    {
      "weight": 100,
      "content": {
        "title": "Your new card is ready",
        "body": "Activate it now to start spending.",
        "imageUrl": "https://example.com/iam/card_promo.png",
        "backgroundColor": "#FFFFFF",
        "textColor": "#111111",
        "style": {
          "padding": {
            "all": 24
          },
          "imageBottomSpacing": 20,
          "titleBottomSpacing": 12,
          "bodyBottomSpacing": 20,
          "primaryCtaBottomSpacing": 12,
          "crossAxisAlignment": "center",
          "textAlign": "center",
          "scrollable": false,
          "backgroundColor": "#FFFFFF",
          "titleStyle": {
            "color": "#111111",
            "fontSize": 22,
            "fontWeight": "w700"
          },
          "bodyStyle": {
            "color": "#333333",
            "fontSize": 16,
            "height": 1.4
          },
          "imageFit": "cover",
          "imageHeight": 180,
          "imageBorderRadius": {
            "topLeft": 12,
            "topRight": 12
          },
          "showCloseButton": true,
          "closeIconColor": "#666666",
          "closeButtonAlignment": {
            "named": "top_right"
          },
          "closeButtonTooltip": "Dismiss",
          "ctaMinimumSize": {
            "height": 48
          },
          "ctaBorderRadius": {
            "all": 10
          }
        },
        "primaryCta": {
          "label": "Activate",
          "action": "deep_link",
          "url": "/card",
          "style": {
            "backgroundColor": "#1E88E5",
            "foregroundColor": "#FFFFFF",
            "overlayColor": "#1565C0",
            "padding": {
              "horizontal": 16,
              "vertical": 10
            },
            "minimumSize": {
              "height": 48
            },
            "borderRadius": {
              "all": 10
            },
            "border": {
              "color": "#1565C0",
              "width": 1
            },
            "elevation": 2,
            "textStyle": {
              "color": "#FFFFFF",
              "fontSize": 15,
              "fontWeight": "w600"
            },
            "iconAlignment": "end",
            "enabled": true
          }
        },
        "secondaryCta": {
          "label": "Later",
          "action": "close",
          "style": {
            "foregroundColor": "#1E88E5",
            "borderRadius": {
              "all": 10
            },
            "minimumSize": {
              "height": 48
            }
          }
        }
      }
    }
  ]
}
```

## `IamBodyStyle` fields

All fields are optional. Omitting a field falls back to the widget-level
value (if provided) and then to the built-in default.

| JSON field                | Type                    | Default                                   |
|---------------------------|-------------------------|-------------------------------------------|
| `padding`                 | `IamEdgeInsets`         | `EdgeInsets.all(20)`                      |
| `imageBottomSpacing`      | `double`                | `16`                                      |
| `titleBottomSpacing`      | `double`                | `8`                                       |
| `bodyBottomSpacing`       | `double`                | `16`                                      |
| `primaryCtaBottomSpacing` | `double`                | `8`                                       |
| `crossAxisAlignment`      | `IamCrossAxisAlignment` | `stretch`                                 |
| `textAlign`               | `IamTextAlign`          | `center`                                  |
| `scrollable`              | `bool`                  | `true` on `fullscreen`, else `false`      |
| `backgroundColor`         | `#rrggbb` / `#aarrggbb` | `null` (transparent)                      |
| `titleStyle`              | `IamTextStyle`          | `Theme.textTheme.titleLarge`              |
| `bodyStyle`               | `IamTextStyle`          | `Theme.textTheme.bodyMedium`              |
| `imageFit`                | `IamBoxFit`             | `cover` (`contain` on `image_only_modal`) |
| `imageHeight`             | `double`                | intrinsic                                 |
| `imageWidth`              | `double`                | intrinsic                                 |
| `imageBorderRadius`       | `IamBorderRadius`       | `null` (square)                           |
| `showCloseButton`         | `bool`                  | `true`                                    |
| `closeIconColor`          | `#rrggbb` / `#aarrggbb` | theme default                             |
| `closeButtonAlignment`    | `IamAlignment`          | `top_right`                               |
| `closeButtonTooltip`      | `string`                | `"Close"`                                 |
| `primaryCtaStyle`         | `IamCtaButtonStyle`     | —                                         |
| `secondaryCtaStyle`       | `IamCtaButtonStyle`     | —                                         |
| `ctaMinimumSize`          | `IamSize`               | `Size.fromHeight(44)`                     |
| `ctaBorderRadius`         | `IamBorderRadius`       | `null`                                    |

> `primaryCtaStyle` / `secondaryCtaStyle` on the body act as a body-wide
> fallback for every CTA button of the variant. They are only used when the
> corresponding `primaryCta.style` / `secondaryCta.style` is not set.

## `IamCtaButtonStyle` fields

| JSON field        | Type                    | Notes                                 |
|-------------------|-------------------------|---------------------------------------|
| `backgroundColor` | `#rrggbb` / `#aarrggbb` | Overrides `content.backgroundColor`.  |
| `foregroundColor` | `#rrggbb` / `#aarrggbb` | Overrides `content.textColor`.        |
| `overlayColor`    | `#rrggbb` / `#aarrggbb` | Ripple / hover color.                 |
| `textStyle`       | `IamTextStyle`          | Merged with the button's text style.  |
| `padding`         | `IamEdgeInsets`         | Internal padding.                     |
| `minimumSize`     | `IamSize`               | Default: `Size.fromHeight(44)`.       |
| `borderRadius`    | `IamBorderRadius`       | Applies a `RoundedRectangleBorder`.   |
| `border`          | `IamBorderSide`         | Applied together with `borderRadius`. |
| `elevation`       | `double`                | Primary (elevated) variant only.      |
| `iconAlignment`   | `start` \| `end`        | Position of an optional icon.         |
| `enabled`         | `bool`                  | `false` disables the button entirely. |

## JSON style primitives

| Primitive         | Accepted shapes                                                                                                                       |
|-------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| `IamEdgeInsets`   | `{ "all": n }` · `{ "horizontal": n, "vertical": n }` · `{ "left": n, "top": n, "right": n, "bottom": n }` (precedence in that order) |
| `IamSize`         | `{ "width": n?, "height": n? }`                                                                                                       |
| `IamBorderRadius` | `{ "all": n }` · `{ "topLeft": n?, "topRight": n?, "bottomLeft": n?, "bottomRight": n? }`                                             |
| `IamBorderSide`   | `{ "color": "#rrggbb", "width": n }` (width defaults to `1`)                                                                          |
| `IamAlignment`    | `{ "named": "top_right" }` · `{ "x": n, "y": n }` with `x`/`y` ∈ `[-1, 1]`. `named` wins.                                             |
| `IamTextStyle`    | `{ "color", "fontSize", "fontWeight", "fontStyle", "letterSpacing", "wordSpacing", "height", "fontFamily" }` (all optional)           |
| Colors            | `#rrggbb` or `#aarrggbb`, leading `#` optional (parsed via `parseIamColor`).                                                          |

## Style enum values

| Enum                      | Values                                                                                                                                 |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| `IamBoxFit`               | `fill` · `contain` · `cover` · `fit_width` · `fit_height` · `none` · `scale_down`                                                      |
| `IamCrossAxisAlignment`   | `start` · `end` · `center` · `stretch` · `baseline`                                                                                    |
| `IamTextAlign`            | `left` · `right` · `center` · `justify` · `start` · `end`                                                                              |
| `IamFontWeight`           | `w100` … `w900`, `normal` (= `w400`), `bold` (= `w700`)                                                                                |
| `IamFontStyle`            | `normal` · `italic`                                                                                                                    |
| `IamNamedAlignment`       | `top_left` · `top_center` · `top_right` · `center_left` · `center` · `center_right` · `bottom_left` · `bottom_center` · `bottom_right` |
| `IamCtaIconAlignmentJson` | `start` · `end`                                                                                                                        |
