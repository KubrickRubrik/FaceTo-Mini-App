import 'package:facetomini/data/models/session.dart';

abstract interface class ApiDbEnvelope {
  Future<SessionModel?> authorized(String languageName);
  Future<SessionModel?> setTheme(String themeName);
  Future<SessionModel?> setLocale(String languageName);
  Future<SessionModel?> setSound(bool enebledSound);
}
