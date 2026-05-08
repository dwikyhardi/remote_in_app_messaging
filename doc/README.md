# Documentation

Reference docs for [`remote_in_app_messaging`](../README.md). Start with the
[Quick start](quick-start.md), then dive into the topic you need.

## Contents

- [Quick start (5 minutes)](quick-start.md) — implement `IamHostBindings`,
  initialize `IamService`, wire triggers.
- [Triggers](triggers.md) — `onAppLaunch` / `onRoute` / `onEvent` and
  where to call them from.
- [JSON schema](json-schema.md) — minimum and full payload, supported
  layouts (including `image_only_modal`), enums, optional fields.
- [Targeting, frequency & schedule](targeting-and-frequency.md) — audience
  filters, rate limits, time windows, and CTA actions.
- [Styling via JSON](styling.md) — `IamBodyStyle` / `IamCtaButtonStyle`
  fields, JSON style primitives, enum values, precedence rules.
- [Public API](api.md) — `IamService` surface and the full
  `IamHostBindings` contract.
