import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';

/// Class for working with user's locale app
abstract final class LocalizationController {
  // All language
  // static const EN = AppLanguage('en', 'English');
  // static const RU = AppLanguage('ru', 'Русский');
  // static const UK = AppLanguage('uk', 'Українська');
  // static const ZH = AppLanguage('zh', '中文');

  // Default list language available for app
  static Map<AvailableAppLocale, AppLanguage> get defaultLanguage => {
        AvailableAppLocale.en: const AppLanguage('en', 'English'),
        AvailableAppLocale.ru: const AppLanguage('ru', 'Русский'),
      };

  // Get locale by type
  static Locale getByType(AvailableAppLocale value) {
    return switch (value) {
      AvailableAppLocale.en => const Locale('en', 'US'),
      AvailableAppLocale.ru => const Locale('ru', 'RU'),
    };
  }

  // Get locale by name
  static AvailableAppLocale getByName(String name) {
    return switch (name) {
      'ru' => AvailableAppLocale.ru,
      'en' => AvailableAppLocale.en,
      _ => AvailableAppLocale.en,
    };
  }

  //
  static String getRankUserDescription(BuildContext context, int idRank) {
    return switch (idRank) {
      2 => context.lcz.rank_2,
      3 => context.lcz.rank_3,
      4 => context.lcz.rank_4,
      5 => context.lcz.rank_5,
      6 => context.lcz.rank_6,
      7 => context.lcz.rank_7,
      8 => context.lcz.rank_8,
      9 => context.lcz.rank_9,
      10 => context.lcz.rank_10,
      11 => context.lcz.rank_11,
      12 => context.lcz.rank_12,
      13 => context.lcz.rank_13,
      14 => context.lcz.rank_14,
      15 => context.lcz.rank_15,
      16 => context.lcz.rank_16,
      17 => context.lcz.rank_17,
      18 => context.lcz.rank_18,
      19 => context.lcz.rank_19,
      20 => context.lcz.rank_20,
      _ => context.lcz.rank_1,
    };
  }

  //! Rank App
  static String getTypeApp(BuildContext context, int idRank) {
    return switch (idRank) {
      2 => context.lcz.typeAppAuthor,
      3 => context.lcz.typeAppCompany,
      _ => context.lcz.typeAppUser,
    };
  }
}

class AppLanguage {
  const AppLanguage(this.code, this.title);
  final String code;
  final String title;
}
