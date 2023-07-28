import 'package:facetomini/data/models/vo/author.dart';
import 'package:facetomini/data/models/vo/scene.dart';
import 'package:facetomini/data/models/vo/series.dart';
import 'package:facetomini/data/models/vo/session.dart';
import 'package:facetomini/domain/entities/vo/scene.dart';
import 'package:facetomini/domain/entities/vo/series.dart';
import 'package:facetomini/domain/entities/vo/app.dart';
import 'package:facetomini/domain/entities/vo/author.dart';

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
        idImage: model.idImage,
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
        idImage: model.idImage,
        url: model.idImage.toString(),
        typeView: model.typeView,
      ),
      typeTree: model.typeTree,
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

  // Unfolding raw author data
  static AuthorEntity setAuthor(AuthorModel model) {
    return AuthorEntity(
      idApp: model.idApp,
      nick: model.nick,
      description: model.description,
      image: ImageAuthor(
        logo: model.image.logo,
        banner: model.image.banner,
      ),
      stat: StatAuthor(
        rank: RankAuthor(
          id: model.stat.rank.id,
          title: model.stat.rank.title,
        ),
        level: model.stat.level,
        rating: model.stat.rating,
        countSub: model.stat.countSub,
      ),
      links: model.links.map((link) {
        return LinkAuthor(
          id: link.id,
          address: link.address,
          icon: IconAuthor(
            id: link.id,
            redirect: link.icon.redirect,
            title: link.icon.title,
            url: link.icon.url,
            pattern: link.icon.pattern,
          ),
        );
      }).toList(),
      follower: model.follower,
    );
  }
}
