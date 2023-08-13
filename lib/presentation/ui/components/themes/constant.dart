part of 'controller.dart';

abstract final class AppColors {
  static const white = Colors.white;
  static const black = Colors.black;
  static const blue = Colors.blue;
  static const red = Colors.red;
  static const darkerRed = Color(0xFFCB5A5E);
  static const blueGrey = Color(0xFF37474F);

  static const List<int> colorsBlot = [
    0xFF1F1F1F,
    0xFFC728FF,
    0xFFAED301,
    0xFF00DCF5,
    0xFFFFAE00,
    0xFFFE281D,
    0xFFC3D4DF,
  ];
}

abstract final class AppImages {
  static const infoApp = "asset/app/info.png";
  static const imageFaceto = "asset/app/faceto.png";
  static const winner = "asset/winner/winner.png";
  static const blot = "asset/scenes/blot.png";
  static const spinLight = "asset/spin/spin_1.gif";
  static const spinDark = "asset/spin/spin_2.gif";
  static const errorApp = "asset/app/error/error_app.png";
}
