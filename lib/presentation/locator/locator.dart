import 'package:get_it/get_it.dart';
import 'package:facetomini/presentation/manager/session/session.dart';

final locator = GetIt.I;

abstract final class ServicesLocator {
  static void setup() {
    // API
    // locator.registerLazySingleton<Repsitory>(() => RepsitoryImpl());
    // locator.registerFactory<Repsitory>(() => RepsitoryImpl());
    // Repository
    // Use Cases
    // Manager
    locator.registerLazySingleton<SessionProvider>(() => SessionProvider());
    // Pages
  }
}
