/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $ResourcesGen {
  const $ResourcesGen();

  $ResourcesImagesGen get images => const $ResourcesImagesGen();
}

class $ResourcesImagesGen {
  const $ResourcesImagesGen();

  $ResourcesImagesHomeGen get home => const $ResourcesImagesHomeGen();
  $ResourcesImagesSettingGen get setting => const $ResourcesImagesSettingGen();
  $ResourcesImagesSummaryGen get summary => const $ResourcesImagesSummaryGen();
}

class $ResourcesImagesHomeGen {
  const $ResourcesImagesHomeGen();

  /// File path: resources/images/home/add_icon.png
  AssetGenImage get addIcon =>
      const AssetGenImage('resources/images/home/add_icon.png');

  /// File path: resources/images/home/forward_arrow.png
  AssetGenImage get forwardArrow =>
      const AssetGenImage('resources/images/home/forward_arrow.png');

  /// File path: resources/images/home/health_and_wellness_icon.png
  AssetGenImage get healthAndWellnessIcon =>
      const AssetGenImage('resources/images/home/health_and_wellness_icon.png');

  /// File path: resources/images/home/home_active_icon.png
  AssetGenImage get homeActiveIcon =>
      const AssetGenImage('resources/images/home/home_active_icon.png');

  /// File path: resources/images/home/home_inactive_icon.png
  AssetGenImage get homeInactiveIcon =>
      const AssetGenImage('resources/images/home/home_inactive_icon.png');

  /// File path: resources/images/home/life_icon.png
  AssetGenImage get lifeIcon =>
      const AssetGenImage('resources/images/home/life_icon.png');

  /// File path: resources/images/home/recent_icon.png
  AssetGenImage get recentIcon =>
      const AssetGenImage('resources/images/home/recent_icon.png');

  /// File path: resources/images/home/setting_icon.png
  AssetGenImage get settingIcon =>
      const AssetGenImage('resources/images/home/setting_icon.png');

  /// File path: resources/images/home/summary_active_icon.png
  AssetGenImage get summaryActiveIcon =>
      const AssetGenImage('resources/images/home/summary_active_icon.png');

  /// File path: resources/images/home/summary_inactive_icon.png
  AssetGenImage get summaryInactiveIcon =>
      const AssetGenImage('resources/images/home/summary_inactive_icon.png');

  /// File path: resources/images/home/work_and_study_icon.png
  AssetGenImage get workAndStudyIcon =>
      const AssetGenImage('resources/images/home/work_and_study_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        addIcon,
        forwardArrow,
        healthAndWellnessIcon,
        homeActiveIcon,
        homeInactiveIcon,
        lifeIcon,
        recentIcon,
        settingIcon,
        summaryActiveIcon,
        summaryInactiveIcon,
        workAndStudyIcon
      ];
}

class $ResourcesImagesSettingGen {
  const $ResourcesImagesSettingGen();

  /// File path: resources/images/setting/about_us_icon.png
  AssetGenImage get aboutUsIcon =>
      const AssetGenImage('resources/images/setting/about_us_icon.png');

  /// File path: resources/images/setting/online_customer_icon.png
  AssetGenImage get onlineCustomerIcon =>
      const AssetGenImage('resources/images/setting/online_customer_icon.png');

  /// File path: resources/images/setting/privacy_policy_icon.png
  AssetGenImage get privacyPolicyIcon =>
      const AssetGenImage('resources/images/setting/privacy_policy_icon.png');

  /// File path: resources/images/setting/user_agreement_icon.png
  AssetGenImage get userAgreementIcon =>
      const AssetGenImage('resources/images/setting/user_agreement_icon.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [aboutUsIcon, onlineCustomerIcon, privacyPolicyIcon, userAgreementIcon];
}

class $ResourcesImagesSummaryGen {
  const $ResourcesImagesSummaryGen();

  /// File path: resources/images/summary/avatar_1.png
  AssetGenImage get avatar1 =>
      const AssetGenImage('resources/images/summary/avatar_1.png');

  /// File path: resources/images/summary/avatar_2.png
  AssetGenImage get avatar2 =>
      const AssetGenImage('resources/images/summary/avatar_2.png');

  /// File path: resources/images/summary/avatar_3.png
  AssetGenImage get avatar3 =>
      const AssetGenImage('resources/images/summary/avatar_3.png');

  /// File path: resources/images/summary/summary_eclipse.png
  AssetGenImage get summaryEclipse =>
      const AssetGenImage('resources/images/summary/summary_eclipse.png');

  /// File path: resources/images/summary/summary_robot.png
  AssetGenImage get summaryRobot =>
      const AssetGenImage('resources/images/summary/summary_robot.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [avatar1, avatar2, avatar3, summaryEclipse, summaryRobot];
}

class Assets {
  Assets._();

  static const $ResourcesGen resources = $ResourcesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
