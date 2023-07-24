import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/domain/entities/app.dart';
import 'package:facetomini/domain/repository/session.dart';
import 'package:facetomini/domain/repository/settings.dart';

/// Authorization case
final class SessionCase implements SessionRepository, SettingsRepository {
  SessionCase(this._sessionRepository, this._settingsRepository);
  final SessionRepository _sessionRepository;
  final SettingsRepository _settingsRepository;
  // Authorized
  @override
  Future<({Failure? fail, SessionEntity? data})> authorization(String languageName) async {
    return await _sessionRepository.authorization(languageName);
  }

  // Save a theme
  @override
  Future<({SessionEntity? data, Failure? fail})> setTheme(String themeName) async {
    return await _settingsRepository.setTheme(themeName);
  }

  // Locale saving
  @override
  Future<({SessionEntity? data, Failure? fail})> setLocale(String languageName) async {
    return await _settingsRepository.setLocale(languageName);
  }

  // Saving sound
  @override
  Future<({SessionEntity? data, Failure? fail})> setSound(bool enebledSound) async {
    return await _settingsRepository.setSound(enebledSound);
  }
}
