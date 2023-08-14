import 'package:flutter/widgets.dart';

abstract final class AppIcons {
  static const _fontFamily = 'IconsApp';
  //! 1
  static const help = IconData(0xe900, fontFamily: _fontFamily);
  static const hot = IconData(0xe901, fontFamily: _fontFamily);
  static const done = IconData(0xe902, fontFamily: _fontFamily);
  static const target = IconData(0xe903, fontFamily: _fontFamily);
  static const lock = IconData(0xe904, fontFamily: _fontFamily);
  static const click = IconData(0xe905, fontFamily: _fontFamily);
  static const back = IconData(0xe906, fontFamily: _fontFamily);
  static const openTree = IconData(0xe907, fontFamily: _fontFamily);
  static const closeTree = IconData(0xe908, fontFamily: _fontFamily);

  static const minTime = IconData(0xe909, fontFamily: _fontFamily);
  static const userTime = IconData(0xe90a, fontFamily: _fontFamily);
  static const timer = IconData(0xe90b, fontFamily: _fontFamily);
  static const swipe = IconData(0xe90c, fontFamily: _fontFamily);
  static const like = IconData(0xe90d, fontFamily: _fontFamily);
  static const info = IconData(0xe90e, fontFamily: _fontFamily);
  static const update = IconData(0xe90f, fontFamily: _fontFamily);
  static const next = IconData(0xe910, fontFamily: _fontFamily);

  static const user = IconData(0xe911, fontFamily: _fontFamily);
  static const users = IconData(0xe912, fontFamily: _fontFamily);

  static const view = IconData(0xe913, fontFamily: _fontFamily);
  static const price = IconData(0xe914, fontFamily: _fontFamily);

  static const copy = IconData(0xe915, fontFamily: _fontFamily);
  static const url = IconData(0xe916, fontFamily: _fontFamily);
  static const language = IconData(0xe917, fontFamily: _fontFamily);

  static const spy = IconData(0xe918, fontFamily: _fontFamily);
  static const oops = IconData(0xe919, fontFamily: _fontFamily);

  static const mark_none = IconData(0xe91a, fontFamily: _fontFamily);
  static const mark_done = IconData(0xe91b, fontFamily: _fontFamily);
  static const settings = IconData(0xe91c, fontFamily: _fontFamily);
  static const add_user = IconData(0xe91d, fontFamily: _fontFamily);
  static const sync_device = IconData(0xe91e, fontFamily: _fontFamily);
  static const sync_user = IconData(0xe91f, fontFamily: _fontFamily);

  static const offline = IconData(0xe920, fontFamily: _fontFamily);
  static const content = IconData(0xe921, fontFamily: _fontFamily);
  static const favorite = IconData(0xe922, fontFamily: _fontFamily);
  static const follow = IconData(0xe923, fontFamily: _fontFamily);
  static const create = IconData(0xe924, fontFamily: _fontFamily);
  static const completed = IconData(0xe925, fontFamily: _fontFamily);
  //
  static const followers = IconData(0xe92a, fontFamily: _fontFamily);
  static const group = IconData(0xe92b, fontFamily: _fontFamily);
  static const companys = IconData(0xe926, fontFamily: _fontFamily);
  static const authors = IconData(0xe927, fontFamily: _fontFamily);
  static const exit = IconData(0xe928, fontFamily: _fontFamily);
  static const search = IconData(0xe929, fontFamily: _fontFamily);
  //
  static const close = IconData(0xe92c, fontFamily: _fontFamily);
  static const restore = IconData(0xe92d, fontFamily: _fontFamily);
  //
  static const sort = IconData(0xe932, fontFamily: _fontFamily);
  static const diagonal = IconData(0xe92e, fontFamily: _fontFamily);
  //
  static const sound = IconData(0xe930, fontFamily: _fontFamily);
}

// import 'package:flutter/material.dart';

// abstract final class AppIcons {
//   AppIcons._();

//   static const String _fontFamily = 'faceto';

//   static const IconData help = IconData(0xe900, fontFamily: _fontFamily);
//   static const IconData hot = IconData(0xe901, fontFamily: _fontFamily);
//   static const IconData done = IconData(0xe902, fontFamily: _fontFamily);
//   static const IconData target = IconData(0xe903, fontFamily: _fontFamily);
//   static const IconData lock = IconData(0xe904, fontFamily: _fontFamily);
//   static const IconData click = IconData(0xe905, fontFamily: _fontFamily);
//   static const IconData back = IconData(0xe906, fontFamily: _fontFamily);
//   static const IconData openTree = IconData(0xe907, fontFamily: _fontFamily);
//   static const IconData closeTree = IconData(0xe908, fontFamily: _fontFamily);
//   static const IconData minTime = IconData(0xe909, fontFamily: _fontFamily);
//   static const IconData userTime = IconData(0xe90a, fontFamily: _fontFamily);
//   static const IconData timer = IconData(0xe90b, fontFamily: _fontFamily);
//   static const IconData swipe = IconData(0xe90c, fontFamily: _fontFamily);
//   static const IconData like = IconData(0xe90d, fontFamily: _fontFamily);
//   static const IconData info = IconData(0xe90e, fontFamily: _fontFamily);
//   static const IconData update = IconData(0xe90f, fontFamily: _fontFamily);
//   static const IconData next = IconData(0xe910, fontFamily: _fontFamily);
//   static const IconData user = IconData(0xe911, fontFamily: _fontFamily);
//   static const IconData users = IconData(0xe912, fontFamily: _fontFamily);
//   static const IconData view = IconData(0xe913, fontFamily: _fontFamily);
//   static const IconData price = IconData(0xe914, fontFamily: _fontFamily);
//   static const IconData copy = IconData(0xe915, fontFamily: _fontFamily);
//   static const IconData url = IconData(0xe916, fontFamily: _fontFamily);
//   static const IconData language = IconData(0xe917, fontFamily: _fontFamily);
//   static const IconData spy = IconData(0xe918, fontFamily: _fontFamily);
//   static const IconData oops = IconData(0xe919, fontFamily: _fontFamily);
//   static const IconData mark_none = IconData(0xe91a, fontFamily: _fontFamily);
//   static const IconData mark_done = IconData(0xe91b, fontFamily: _fontFamily);
//   static const IconData settings = IconData(0xe91c, fontFamily: _fontFamily);
//   static const IconData add_user = IconData(0xe91d, fontFamily: _fontFamily);
//   static const IconData sync_device = IconData(0xe91e, fontFamily: _fontFamily);
//   static const IconData sync_user = IconData(0xe91f, fontFamily: _fontFamily);
//   static const IconData offline = IconData(0xe920, fontFamily: _fontFamily);
//   static const IconData content = IconData(0xe921, fontFamily: _fontFamily);
//   static const IconData favorite = IconData(0xe922, fontFamily: _fontFamily);
//   static const IconData follow = IconData(0xe923, fontFamily: _fontFamily);
//   static const IconData add = IconData(0xe924, fontFamily: _fontFamily);
//   static const IconData completed = IconData(0xe925, fontFamily: _fontFamily);
//   static const IconData companys = IconData(0xe926, fontFamily: _fontFamily);
//   static const IconData authors = IconData(0xe927, fontFamily: _fontFamily);
//   static const IconData exit = IconData(0xe928, fontFamily: _fontFamily);
//   static const IconData search = IconData(0xe929, fontFamily: _fontFamily);
//   static const IconData followers = IconData(0xe92a, fontFamily: _fontFamily);
//   static const IconData group = IconData(0xe92b, fontFamily: _fontFamily);
//   static const IconData close = IconData(0xe92c, fontFamily: _fontFamily);
//   static const IconData restore = IconData(0xe92d, fontFamily: _fontFamily);
//   static const IconData diagonal = IconData(0xe92e, fontFamily: _fontFamily);
//   static const IconData sub = IconData(0xe92f, fontFamily: _fontFamily);
//   static const IconData sound = IconData(0xe930, fontFamily: _fontFamily);
//   static const IconData sort = IconData(0xe932, fontFamily: _fontFamily);
// }
