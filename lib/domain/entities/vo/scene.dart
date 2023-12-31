import 'package:facetomini/core/config/entity.dart';

final class SceneEntity {
  final int idScene;
  final int idSeries;

  final ImageScene image;
  final int typeTree;
  final int hardLevel;

  final UserScene user;

  final String grid;

  final StatScene stat;

  SceneEntity({
    required this.idScene,
    required this.idSeries,
    required this.image,
    required this.typeTree,
    required this.hardLevel,
    required this.user,
    required this.grid,
    required this.stat,
  });
}

/// Image of scene
final class ImageScene {
  final int idImage;
  final String url;
  final int typeView;
  final TypeSourceImage typeSourceImage;

  ImageScene({
    required this.idImage,
    required this.url,
    required this.typeView,
  }) : typeSourceImage = _setTypeSourceImage(url);

  ImageScene.empty()
      : idImage = -1,
        url = '',
        typeView = 0,
        typeSourceImage = TypeSourceImage.asset;

  // Setting the image source
  static _setTypeSourceImage(String url) {
    if (url.startsWith('http')) {
      return TypeSourceImage.server;
    } else {
      return TypeSourceImage.asset;
    }
  }
}

/// User data of scene
final class UserScene {
  final AuthorUserScene author;
  final StateViewUserScene stat;

  UserScene({
    required this.author,
    required this.stat,
  });
}

/// User as author of scene
final class AuthorUserScene {
  final int idApp;

  AuthorUserScene(this.idApp);
}

/// Current user statistics in scene
final class StateViewUserScene {
  final int xp;
  int completed;

  StateViewUserScene({
    required this.xp,
    required this.completed,
  });
}

/// General statistics of the series
final class StatScene {
  int recordTime;
  int countUsers;

  StatScene({
    required this.recordTime,
    required this.countUsers,
  });
}
