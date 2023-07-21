import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_loc.dart';

extension EContext on BuildContext {
  // To simplify obtaining honey parameters
  MediaQueryData get media => MediaQuery.of(this);
  // To get the current localization of an application
  AppLocalization get lcz => AppLocalization.of(this)!;
  // To get the text styles of the current topic
  ETextStyle get textStyle => ETextStyle(this);
}

/// Class with customized text styles in [ThemesController]
class ETextStyle {
  final BuildContext context;
  ETextStyle(this.context);
  TextStyle get titleLarge => Theme.of(context).textTheme.titleLarge!;
  TextStyle get titleMedium => Theme.of(context).textTheme.titleMedium!;
  TextStyle get titleSmall => Theme.of(context).textTheme.titleSmall!;
  TextStyle get bodyLarge => Theme.of(context).textTheme.bodyLarge!;
  TextStyle get bodyMedium => Theme.of(context).textTheme.bodyMedium!;
  TextStyle get bodySmall => Theme.of(context).textTheme.bodySmall!;
}
