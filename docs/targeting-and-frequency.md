# Targeting, frequency & schedule

All three blocks are **optional**. When omitted (or set to an empty list /
`null`) the message has no constraint on that dimension.

## Targeting

- All fields are optional. Empty list / `null` means "no constraint".
- `minAppVersion` / `maxAppVersion` accept semver (`1.13.0`).
- Available filters: `platforms`, `envs`, `minAppVersion`, `maxAppVersion`,
  `organizations`, `excludeOrganizations`, `roles`, `allowUserIds`,
  `denyUserIds`.

## Frequency

- `maxImpressions` caps the number of times a message is shown per user.
- `dismissBehavior` decides what happens after the user dismisses without
  a CTA:
  - `do_not_show_again` — the message is locked out for the user.
  - `allow_retry` — the message is eligible again on the next trigger.

## Schedule

- `startAt` / `endAt` are ISO-8601 timestamps (UTC).
- Both are optional and independent — set only the bound you need.

## CTA actions

| Action         | Behavior                                                          |
|----------------|-------------------------------------------------------------------|
| `close`        | Dismisses the current message.                                    |
| `deep_link`    | Calls `IamHostBindings.openDeepLink(url)` (in-app route).         |
| `external_url` | Calls `IamHostBindings.openExternalUrl(url)` (system browser).    |

A failed `deep_link` emits an `iam_cta_invalid_path` analytics event.

See the [JSON schema full example](json-schema.md#full-example) for the
exact field layout under `targeting`, `frequency`, `startAt` / `endAt`
and CTA blocks.
