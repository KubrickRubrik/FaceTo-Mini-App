part of "../controller.dart";

ThemeData createDarkTheme() {
  return ThemeData(
    fontFamily: 'Comfortaa',
    textTheme: const TextTheme(
        // titleLarge: title18Dark,
        // titleMedium: title16Dark,
        // titleSmall: title14Dark,
        // bodyLarge: body18Dark,
        // bodyMedium: body16Dark,
        // bodySmall: body14Dark,
        // displayLarge: display18Dark,
        ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 25,
    ),
    scaffoldBackgroundColor: AppColors.blueGrey,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    focusColor: Colors.blue.withOpacity(0.2),
  );
}
