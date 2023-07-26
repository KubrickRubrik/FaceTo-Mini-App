import 'package:facetomini/data/api/core/database/config/connect.dart';

final class SeriesModel {
  final int id;
  final int idSeries;
  final int idImage;
  final int typeView;
  final int idApp;
  final String nick;
  final int xp;
  final int rating;
  final int completed;
  final int favorites;
  final int typeTree;
  final int hardLevel;
  final int bestTime;
  final int ratingSeries;
  final int countUsersRating;
  final int countUsers;
  final int countScenes;

  SeriesModel(TableSeries tb)
      : id = tb.id,
        idSeries = tb.idSeries,
        idImage = tb.idImage,
        typeView = tb.typeView,
        idApp = tb.idApp,
        nick = tb.nick,
        xp = tb.xp,
        rating = tb.rating,
        completed = tb.completed,
        favorites = tb.favorites,
        typeTree = tb.typeTree,
        hardLevel = tb.hardLevel,
        bestTime = tb.bestTime,
        ratingSeries = tb.ratingSeries,
        countUsersRating = tb.countUsersRating,
        countUsers = tb.countUsers,
        countScenes = tb.countScenes;
}
