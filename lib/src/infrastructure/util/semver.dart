/// Lightweight semver-ish comparison used for `minAppVersion` / `maxAppVersion`
/// targeting. Supports `MAJOR.MINOR.PATCH[.BUILD]` with any pre-release suffix
/// after a `-` or `+` being ignored. Missing components default to `0`.
///
/// Returns a negative number if `a < b`, zero if equal, positive if `a > b`.
int compareSemver(String a, String b) {
  final pa = _parse(a);
  final pb = _parse(b);
  final len = pa.length > pb.length ? pa.length : pb.length;
  for (var i = 0; i < len; i++) {
    final va = i < pa.length ? pa[i] : 0;
    final vb = i < pb.length ? pb[i] : 0;
    if (va != vb) return va - vb;
  }
  return 0;
}

/// Returns true if [version] is within `[min, max]` (both inclusive). Either
/// bound may be null / empty — treated as "no bound".
bool isVersionInRange(String version, {String? min, String? max}) {
  if (min != null && min.isNotEmpty && compareSemver(version, min) < 0) {
    return false;
  }
  if (max != null && max.isNotEmpty && compareSemver(version, max) > 0) {
    return false;
  }
  return true;
}

List<int> _parse(String raw) {
  // Strip pre-release / build suffixes like "-beta.1" or "+123".
  final cut = _firstIndexOfAny(raw, const <String>['-', '+']);
  final core = cut >= 0 ? raw.substring(0, cut) : raw;
  return core
      .split('.')
      .map((String part) => int.tryParse(part) ?? 0)
      .toList(growable: false);
}

int _firstIndexOfAny(String s, List<String> needles) {
  var best = -1;
  for (final n in needles) {
    final i = s.indexOf(n);
    if (i >= 0 && (best == -1 || i < best)) best = i;
  }
  return best;
}
