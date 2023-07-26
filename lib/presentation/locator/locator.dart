import 'package:facetomini/data/api/core/database/api.dart';
import 'package:facetomini/data/api/core/server/api_server.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:facetomini/data/api/interfaces/api_server.dart';
import 'package:facetomini/data/repository/author.dart';
import 'package:facetomini/data/repository/scenes.dart';
import 'package:facetomini/data/repository/series.dart';
import 'package:facetomini/data/repository/session.dart';
import 'package:facetomini/data/repository/settings.dart';
import 'package:facetomini/domain/repository/author.dart';
import 'package:facetomini/domain/repository/scenes.dart';
import 'package:facetomini/domain/repository/series.dart';
import 'package:facetomini/domain/repository/session.dart';
import 'package:facetomini/domain/repository/settings.dart';
import 'package:facetomini/domain/use_cases/author.dart';
import 'package:facetomini/domain/use_cases/scenes.dart';
import 'package:facetomini/domain/use_cases/series.dart';
import 'package:facetomini/domain/use_cases/session.dart';
import 'package:facetomini/presentation/manager/author/author.dart';
import 'package:facetomini/presentation/manager/pages/a_home/controller/controller.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_1_series/series.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_2_scenes/scenes.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_3_scene/scene.dart';
import 'package:facetomini/presentation/manager/session/session.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;

abstract final class ServicesLocator {
  static void setup() {
    // API
    locator.registerLazySingleton<ApiDbEnvelope>(() => ApiDbDrift());
    locator.registerLazySingleton<ApiServerEnvelope>(() => ApiServer());
    // Repository
    locator.registerLazySingleton<SessionRepository>(() => SessionRepositoryImpl(locator()));
    locator.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryImpl(locator()));
    locator.registerLazySingleton<SeriesRepository>(() => SeriesRepositoryImpl(locator()));
    locator.registerLazySingleton<ScenesRepository>(() => ScenesRepositoryImpl(locator()));
    locator.registerLazySingleton<AuthorRepository>(() => AuthorRepositoryImpl(locator()));
    // Use Cases
    locator.registerLazySingleton<SessionCase>(() => SessionCase(locator(), locator()));
    locator.registerLazySingleton<SeriesCase>(() => SeriesCase(locator()));
    locator.registerLazySingleton<ScenesCase>(() => ScenesCase(locator()));
    locator.registerLazySingleton<AuthorCase>(() => AuthorCase(locator()));
    // Manager
    locator.registerLazySingleton<SessionProvider>(() => SessionProvider(locator()));
    // Pages
    locator.registerLazySingleton(() => PagesControllerProvider());
    locator.registerLazySingleton(() => SeriesProvider(locator()));
    locator.registerLazySingleton(() => ScenesProvider(locator()));
    locator.registerLazySingleton(() => SceneProvider(locator()));
    locator.registerLazySingleton(() => AuthorProvider(locator()));
  }
}
