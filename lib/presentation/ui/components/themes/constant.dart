part of 'controller.dart';

const title18Light = TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black);
const title16Light = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
const title14Light = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);

const body18Light = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
const body16Light = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
const body14Light = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);

const display18Light = TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white);

const title18Dark = TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue);
const title16Dark = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
const title14Dark = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
const body18Dark = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
const body16Dark = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
const body14Dark = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);

const display18Dark = TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white);

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

abstract class AppImages {
  static const infoApp = "asset/app/info.png";
  static const imageFaceto = "asset/app/faceto.png";
  static const winner = "asset/winner/winner.png";
  static const blot = "asset/scenes/blot.png";
  static const spinLight = "asset/spin/spin_1.gif";
  static const spinDark = "asset/spin/spin_2.gif";
  static const errorApp = "asset/app/error/error_app.png";
}
