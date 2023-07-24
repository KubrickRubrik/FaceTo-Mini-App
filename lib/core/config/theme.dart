import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:flutter/material.dart';

abstract final class ConfigThemes {
  // All language
  static Map<CurrentThemeApp, String> defaultThemes(BuildContext context) => {
        CurrentThemeApp.light: context.lcz.themeSettingsLight,
        CurrentThemeApp.dark: context.lcz.themeSettingsDark,
      };
}
