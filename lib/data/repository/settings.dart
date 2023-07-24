import 'package:facetomini/core/errors/exception.dart';
import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:facetomini/data/mapper/mapper.dart';
import 'package:facetomini/domain/entities/app.dart';
import 'package:facetomini/domain/repository/settings.dart';

final class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._apiDbEnvelope);
  ApiDbEnvelope _apiDbEnvelope;
  // Save a theme
  @override
  Future<({SessionEntity? data, Failure? fail})> setTheme(String themeName) async {
    try {
      final response = await _apiDbEnvelope.setTheme(themeName);
      if (response == null) return (data: null, fail: null);
      //
      final result = EntitiesMapper.setSettings(response);
      return (data: result, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      throw (data: null, fail: DataFormatFailuer('Error api data'));
    }
  }

  // Locale saving
  @override
  Future<({SessionEntity? data, Failure? fail})> setLocale(String languageName) async {
    try {
      final response = await _apiDbEnvelope.setLocale(languageName);
      if (response == null) return (data: null, fail: null);
      //
      final result = EntitiesMapper.setSettings(response);
      return (data: result, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      throw (data: null, fail: DataFormatFailuer('Error api data'));
    }
  }

  // Saving sound
  @override
  Future<({SessionEntity? data, Failure? fail})> setSound(bool enebledSound) async {
    try {
      final response = await _apiDbEnvelope.setSound(enebledSound);
      if (response == null) return (data: null, fail: null);
      //
      final result = EntitiesMapper.setSettings(response);
      return (data: result, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      throw (data: null, fail: DataFormatFailuer('Error api data'));
    }
  }
}
