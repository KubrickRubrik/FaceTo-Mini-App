import 'package:facetomini/core/config/entity.dart';

final class SeriesEntity {
  final int idSeries;
  final ImageSeries image;
  final UserSeries user;

  final int typeTree;
  final int hardLevel;

  final StatSeries stat;

  SeriesEntity({
    required this.idSeries,
    required this.image,
    required this.user,
    required this.typeTree,
    required this.hardLevel,
    required this.stat,
  });
}

/// Image of series
final class ImageSeries {
  final int idImage;
  final String url;
  final int typeView;
  final TypeSourceImage typeSourceImage;

  ImageSeries({
    required this.idImage,
    required this.url,
    required this.typeView,
  }) : typeSourceImage = _setTypeSourceImage(url);

  // Setting the image source
  static _setTypeSourceImage(String url) {
    if (url.startsWith('http')) {
      return TypeSourceImage.server;
    } else {
      return TypeSourceImage.asset;
    }
  }
}

/// User data of series
final class UserSeries {
  final AuthorUserSeires author;
  final StateViewUserSeries stat;

  UserSeries({
    required this.author,
    required this.stat,
  });
}

/// User as author of series
final class AuthorUserSeires {
  final int idApp;
  final String nick;

  AuthorUserSeires(this.idApp, this.nick);
}

/// Current user statistics in series
final class StateViewUserSeries {
  final int xp;
  final int completed;
  final int rating;
  final int favorites;
  final int offline = 1;

  StateViewUserSeries({
    required this.xp,
    required this.completed,
    required this.rating,
    required this.favorites,
  });
}

/// General statistics of the series
final class StatSeries {
  final int bestTime;
  final double ratingSeries;
  final int countUsersRating;
  final int countUsers;
  final int countScenes;

  StatSeries({
    required this.bestTime,
    required this.ratingSeries,
    required this.countUsersRating,
    required this.countUsers,
    required this.countScenes,
  });
}
