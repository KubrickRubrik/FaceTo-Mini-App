import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';
part 'list/dark.dart';
part 'list/light.dart';
part 'constant.dart';

abstract final class ThemesController {
  static ThemeData set(CurrentThemeApp value) {
    return switch (value) {
      CurrentThemeApp.dark => createDarkTheme(),
      CurrentThemeApp.light => createLightTheme(),
    };
  }
}
