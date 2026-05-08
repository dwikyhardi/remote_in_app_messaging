/// Style precedence resolver shared by `IamBody` and `IamCtaButton`.
///
/// The contract across the package is fixed:
///
///   widget-level argument > JSON-payload `style` > built-in default.
///
/// [resolveStyle] expresses that contract once so callers do not have to
/// re-write the same `?? ?? fallback` chain at every site.
T resolveStyle<T>(T? widget, T? json, T fallback) =>
    widget ?? json ?? fallback;

/// Same as [resolveStyle] but the fallback is itself nullable. Useful when a
/// missing JSON value should propagate as `null` to keep the underlying
/// widget's own default.
T? resolveStyleNullable<T>(T? widget, T? json, [T? fallback]) =>
    widget ?? json ?? fallback;
