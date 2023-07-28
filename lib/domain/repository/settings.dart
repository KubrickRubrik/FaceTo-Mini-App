import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/domain/entities/vo/app.dart';

abstract interface class SettingsRepository {
  // Save a theme
  Future<({SessionEntity? data, Failure? fail})> setTheme(String themeName);
  // Locale saving
  Future<({SessionEntity? data, Failure? fail})> setLocale(String languageName);
  // Saving sound
  Future<({SessionEntity? data, Failure? fail})> setSound(bool enebledSound);
}
