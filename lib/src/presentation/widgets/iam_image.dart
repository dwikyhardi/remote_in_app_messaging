import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Source/format-aware image widget used by image-bearing IAM layouts.
///
/// Picks the right rendering path based on:
///   * source — `http://` / `https://` prefix → network, otherwise asset;
///   * format — `.svg` extension (case-insensitive) → `flutter_svg`,
///     otherwise raster `Image` (which natively handles `.png`, `.jpg`,
///     `.jpeg`, `.gif`, `.webp`, `.bmp`).
///
/// Provides defensive error / placeholder builders so a bad path never
/// crashes the host. The widget is intentionally Flutter-only and does not
/// import anything from this package's domain or infrastructure layers.
class IamImage extends StatelessWidget {
  const IamImage({
    super.key,
    required this.path,
    this.fit = BoxFit.contain,
    this.height,
    this.width,
  });

  /// Asset path (e.g. `assets/parrot.jpg`) or full `http(s)://` URL.
  final String path;

  /// How the image should be inscribed into the layout box.
  final BoxFit fit;

  /// Optional explicit height; defaults to `null` so the parent decides.
  final double? height;

  /// Optional explicit width; defaults to `null` so the parent decides.
  final double? width;

  @override
  Widget build(BuildContext context) {
    return buildIamImage(path: path, fit: fit, height: height, width: width);
  }
}

/// Top-level helper that returns the right widget for [path].
///
/// Hosts can call this directly when they want the same source/format
/// detection without instantiating an [IamImage].
///
/// [errorBuilder] is forwarded to the underlying raster `Image.network` /
/// `Image.asset` (it has no effect on the SVG branch). When omitted, a
/// defensive built-in error tile is used.
Widget buildIamImage({
  required String path,
  BoxFit fit = BoxFit.contain,
  double? height,
  double? width,
  ImageErrorWidgetBuilder? errorBuilder,
}) {
  final isNetwork = path.startsWith('http://') || path.startsWith('https://');
  final isSvg = path.toLowerCase().endsWith('.svg');

  if (isSvg) {
    return isNetwork
        ? SvgPicture.network(
            path,
            fit: fit,
            height: height,
            width: width,
            placeholderBuilder: (_) =>
                _placeholder(height: height, width: width),
          )
        : SvgPicture.asset(
            path,
            fit: fit,
            height: height,
            width: width,
            placeholderBuilder: (_) =>
                _placeholder(height: height, width: width),
          );
  }

  final effErrorBuilder =
      errorBuilder ?? (_, _, _) => _errorTile(height: height, width: width);

  return isNetwork
      ? Image.network(
          path,
          fit: fit,
          height: height,
          width: width,
          errorBuilder: effErrorBuilder,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            final expected = progress.expectedTotalBytes;
            final value = expected != null && expected > 0
                ? progress.cumulativeBytesLoaded / expected
                : null;
            return _placeholder(
              height: height,
              width: width,
              progress: value,
            );
          },
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded || frame != null) return child;
            return _placeholder(height: height, width: width);
          },
        )
      : Image.asset(
          path,
          fit: fit,
          height: height,
          width: width,
          errorBuilder: effErrorBuilder,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded || frame != null) return child;
            return _placeholder(height: height, width: width);
          },
        );
}

Widget _placeholder({double? height, double? width, double? progress}) {
  return Container(
    height: height,
    width: width,
    color: const Color(0x11000000),
    alignment: Alignment.center,
    child: SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        value: progress,
      ),
    ),
  );
}

Widget _errorTile({double? height, double? width}) {
  return Container(
    height: height,
    width: width,
    color: const Color(0x11000000),
    alignment: Alignment.center,
    child: const Icon(Icons.broken_image_outlined, size: 32),
  );
}
