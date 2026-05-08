# Triggers

Each trigger runs the engine once: targeting, frequency, schedule and the
selected variant are all resolved before a renderer is shown.

| Trigger     | Call                                         | Typical source                     |
|-------------|----------------------------------------------|------------------------------------|
| Launch      | `IamService.instance?.onAppLaunch()`         | After login / first frame          |
| Route       | `IamService.instance?.onRoute('/home')`      | `NavigatorObserver.didPush`        |
| Event       | `IamService.instance?.onEvent(name, params)` | Your analytics / tracking pipeline |

See [Quick start](quick-start.md#3-wire-the-triggers) for end-to-end
wiring examples and [JSON schema](json-schema.md) for the matching
`trigger.type` values (`on_launch`, `on_route`, `on_event`).
