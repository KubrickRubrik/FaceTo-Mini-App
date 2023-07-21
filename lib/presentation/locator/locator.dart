import 'package:facetomini/data/api/core/database/api.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:facetomini/data/repository/authorization.dart';
import 'package:facetomini/domain/repository/authorization.dart';
import 'package:facetomini/domain/use_cases/authorization.dart';
import 'package:facetomini/presentation/manager/pages/a_home/controller/controller.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_1_series/series.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_2.scenes/scenes.dart';
import 'package:facetomini/presentation/manager/session/session.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;

abstract final class ServicesLocator {
  static void setup() {
    // API
    locator.registerLazySingleton<ApiDbEnvelope>(() => ApiDbDrift());
    // Repository
    locator.registerLazySingleton<AuthorizationRepository>(() => AuthorizationRepositoryImpl(locator()));
    // Use Cases
    locator.registerLazySingleton<AuthorizationCase>(() => AuthorizationCase(locator()));
    // Manager
    locator.registerLazySingleton<SessionProvider>(() => SessionProvider(locator()));
    // Pages
    locator.registerLazySingleton(() => PageControllerProvider());
    locator.registerLazySingleton(() => SeriesProvider());
    locator.registerLazySingleton(() => ScenesProvider());
  }
}
