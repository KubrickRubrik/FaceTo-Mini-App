import 'package:facetomini/data/api/core/database/api.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:get_it/get_it.dart';
import 'package:facetomini/presentation/manager/session/session.dart';

final locator = GetIt.I;

abstract final class ServicesLocator {
  static void setup() {
    // API
    locator.registerLazySingleton<ApiDbEnvelope>(() => ApiDbDrift());
    // Repository
    // Use Cases
    // Manager
    locator.registerLazySingleton<SessionProvider>(() => SessionProvider());
    // Pages
  }
}
