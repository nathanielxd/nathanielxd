/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsBackgroundsGen {
  const $AssetsBackgroundsGen();

  /// File path: assets/backgrounds/heretic.jpg
  AssetGenImage get heretic =>
      const AssetGenImage('assets/backgrounds/heretic.jpg');

  /// File path: assets/backgrounds/malaga.jpg
  AssetGenImage get malaga =>
      const AssetGenImage('assets/backgrounds/malaga.jpg');

  /// File path: assets/backgrounds/sunflower.jpg
  AssetGenImage get sunflower =>
      const AssetGenImage('assets/backgrounds/sunflower.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [heretic, malaga, sunflower];
}

class $AssetsCarouselGen {
  const $AssetsCarouselGen();

  /// File path: assets/carousel/lanchat.jpeg
  AssetGenImage get lanchat =>
      const AssetGenImage('assets/carousel/lanchat.jpeg');

  /// File path: assets/carousel/lethologica.jpg
  AssetGenImage get lethologica =>
      const AssetGenImage('assets/carousel/lethologica.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [lanchat, lethologica];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/flutterfall.jpg
  AssetGenImage get flutterfall =>
      const AssetGenImage('assets/icons/flutterfall.jpg');

  /// File path: assets/icons/lanchat.webp
  AssetGenImage get lanchat => const AssetGenImage('assets/icons/lanchat.webp');

  /// File path: assets/icons/lethologica.png
  AssetGenImage get lethologica =>
      const AssetGenImage('assets/icons/lethologica.png');

  /// File path: assets/icons/lockie.jpg
  AssetGenImage get lockie => const AssetGenImage('assets/icons/lockie.jpg');

  /// File path: assets/icons/magichome.png
  AssetGenImage get magichome =>
      const AssetGenImage('assets/icons/magichome.png');

  /// File path: assets/icons/tapline.webp
  AssetGenImage get tapline => const AssetGenImage('assets/icons/tapline.webp');

  /// File path: assets/icons/vocabulary.webp
  AssetGenImage get vocabulary =>
      const AssetGenImage('assets/icons/vocabulary.webp');

  /// List of all assets
  List<AssetGenImage> get values => [
        flutterfall,
        lanchat,
        lethologica,
        lockie,
        magichome,
        tapline,
        vocabulary
      ];
}

class Assets {
  Assets._();

  static const $AssetsBackgroundsGen backgrounds = $AssetsBackgroundsGen();
  static const $AssetsCarouselGen carousel = $AssetsCarouselGen();
  static const AssetGenImage headshot = AssetGenImage('assets/headshot.png');
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const String resume = 'assets/resume.yaml';

  /// List of all assets
  static List<dynamic> get values => [headshot, resume];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
