import 'package:facetomini/data/models/scene.dart';
import 'package:facetomini/data/models/series.dart';
import 'package:facetomini/data/models/session.dart';
import 'package:facetomini/domain/entities/app.dart';
import 'package:facetomini/domain/entities/scene.dart';
import 'package:facetomini/domain/entities/series.dart';

/// Transformation of the 'raw' models in the entities used
abstract final class EntitiesMapper {
  // Unfolding raw authorization data
  static SessionEntity setAuthorized(SessionModel model) {
    return SessionEntity(
      idApp: model.idApp,
      enabledSound: model.enabledSound,
      locale: model.language,
      theme: model.theme,
    );
  }

  // Unfolding raw settings data
  static SessionEntity setSettings(SessionModel model) {
    return SessionEntity(
      idApp: 0,
      enabledSound: model.enabledSound,
      locale: model.language,
      theme: model.theme,
    );
  }

  // Unfolding raw series data
  static SeriesEntity setSeries(SeriesModel model) {
    return SeriesEntity(
      idSeries: model.idSeries,
      image: ImageSeries(
        id: model.idImage,
        url: model.idImage.toString(),
        typeView: model.typeView,
      ),
      user: UserSeries(
        author: AuthorUserSeires(model.idApp, model.nick),
        stat: StateViewUserSeries(
          xp: model.xp,
          completed: model.completed,
          rating: model.rating,
          favorites: model.favorites,
        ),
      ),
      typeTree: model.typeTree,
      hardLevel: model.hardLevel,
      stat: StatSeries(
        bestTime: model.bestTime,
        ratingSeries: model.ratingSeries,
        countUsersRating: model.countUsersRating,
        countUsers: model.countUsers,
        countScenes: model.countScenes,
      ),
    );
  }

  // Unfolding raw scenes data
  static SceneEntity setScene(SceneModel model) {
    return SceneEntity(
      idScene: model.idScene,
      idSeries: model.idSeries,
      image: ImageScene(
        id: model.idImage,
        url: model.idImage.toString(),
        typeView: model.typeView,
      ),
      user: UserScene(
          author: AuthorUserScene(model.idApp),
          stat: StateViewUserScene(
            xp: model.xp,
            completed: model.completed,
          )),
      grid: model.grid,
      stat: StatScene(
        recordTime: model.recordTime,
        countUsers: model.countUsers,
      ),
    );
  }
}
