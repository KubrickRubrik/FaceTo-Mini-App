import 'package:facetomini/core/errors/exception.dart';
import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:facetomini/data/mapper/app.dart';
import 'package:facetomini/domain/entities/app.dart';
import 'package:facetomini/domain/repository/settings.dart';

final class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this.apiDbEnvelope);
  ApiDbEnvelope apiDbEnvelope;
  // Save a theme
  @override
  Future<({SessionEntity? data, Failure? fail})> setTheme(String themeName) async {
    try {
      final response = await apiDbEnvelope.setTheme(themeName);
      final result = EntitiesMapper.authorizedMapper(response);
      return (fail: null, data: result);
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
      final response = await apiDbEnvelope.setLocale(languageName);
      final result = EntitiesMapper.authorizedMapper(response);
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
      final response = await apiDbEnvelope.setSound(enebledSound);
      final result = EntitiesMapper.authorizedMapper(response);
      return (data: result, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      throw (data: null, fail: DataFormatFailuer('Error api data'));
    }
  }
}
