/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsProviderGen {
  const $AssetsProviderGen();

  /// File path: assets/provider/provider_1.jpg
  AssetGenImage get provider1 =>
      const AssetGenImage('assets/provider/provider_1.jpg');

  /// File path: assets/provider/provider_2.jpg
  AssetGenImage get provider2 =>
      const AssetGenImage('assets/provider/provider_2.jpg');

  /// File path: assets/provider/provider_3.jpg
  AssetGenImage get provider3 =>
      const AssetGenImage('assets/provider/provider_3.jpg');

  /// File path: assets/provider/provider_4.jpg
  AssetGenImage get provider4 =>
      const AssetGenImage('assets/provider/provider_4.jpg');

  /// File path: assets/provider/provider_5.jpg
  AssetGenImage get provider5 =>
      const AssetGenImage('assets/provider/provider_5.jpg');

  /// File path: assets/provider/provider_6.jpg
  AssetGenImage get provider6 =>
      const AssetGenImage('assets/provider/provider_6.jpg');

  /// File path: assets/provider/provider_7.jpg
  AssetGenImage get provider7 =>
      const AssetGenImage('assets/provider/provider_7.jpg');

  /// File path: assets/provider/provider_8.jpg
  AssetGenImage get provider8 =>
      const AssetGenImage('assets/provider/provider_8.jpg');

  /// File path: assets/provider/provider_9.jpg
  AssetGenImage get provider9 =>
      const AssetGenImage('assets/provider/provider_9.jpg');
}

class $AssetsUserGen {
  const $AssetsUserGen();

  /// File path: assets/user/user_1.jpg
  AssetGenImage get user1 => const AssetGenImage('assets/user/user_1.jpg');

  /// File path: assets/user/user_2.jpg
  AssetGenImage get user2 => const AssetGenImage('assets/user/user_2.jpg');

  /// File path: assets/user/user_3.jpg
  AssetGenImage get user3 => const AssetGenImage('assets/user/user_3.jpg');

  /// File path: assets/user/user_4.jpg
  AssetGenImage get user4 => const AssetGenImage('assets/user/user_4.jpg');

  /// File path: assets/user/user_5.jpg
  AssetGenImage get user5 => const AssetGenImage('assets/user/user_5.jpg');

  /// File path: assets/user/user_6.jpg
  AssetGenImage get user6 => const AssetGenImage('assets/user/user_6.jpg');

  /// File path: assets/user/user_7.jpg
  AssetGenImage get user7 => const AssetGenImage('assets/user/user_7.jpg');

  /// File path: assets/user/user_8.jpg
  AssetGenImage get user8 => const AssetGenImage('assets/user/user_8.jpg');
}

class Assets {
  Assets._();

  static const AssetGenImage icon = AssetGenImage('assets/icon.png');
  static const $AssetsProviderGen provider = $AssetsProviderGen();
  static const $AssetsUserGen user = $AssetsUserGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
