part of "../controller.dart";

ThemeData createLightTheme() {
  return ThemeData(
    fontFamily: 'Comfortaa',
    textTheme: const TextTheme(
      titleLarge: title18Light,
      titleMedium: title16Light,
      titleSmall: title14Light,
      bodyLarge: body18Light,
      bodyMedium: body16Light,
      bodySmall: body14Light,
      displayLarge: display18Light,
    ),
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Colors.white, size: 25),
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  );
}
