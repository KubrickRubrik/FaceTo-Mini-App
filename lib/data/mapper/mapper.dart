import 'package:facetomini/data/models/vo/author.dart';
import 'package:facetomini/data/models/vo/scene.dart';
import 'package:facetomini/data/models/vo/series.dart';
import 'package:facetomini/data/models/vo/session.dart';
import 'package:facetomini/data/models/vo/stat_puzzle.dart';
import 'package:facetomini/data/models/vo/winners.dart';
import 'package:facetomini/domain/entities/vo/scene.dart';
import 'package:facetomini/domain/entities/vo/series.dart';
import 'package:facetomini/domain/entities/vo/app.dart';
import 'package:facetomini/domain/entities/vo/author.dart';
import 'package:facetomini/domain/entities/vo/stat_puzzle.dart';
import 'package:facetomini/domain/entities/vo/winners.dart';

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
          rating: model.ratingUser,
          favorites: model.favorites,
        ),
      ),
      typeTree: model.typeTree,
      hardLevel: model.hardLevel,
      stat: StatSeries(
        timeRecord: model.bestTime,
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
      hardLevel: model.hardLevel,
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

  static PuzzleUpdatesEntity setPuzzleUpdates(PuzzleUpdatesModel model) {
    return PuzzleUpdatesEntity(
      series: SeriesPuzzleUpdatesEntity(
        idSeires: model.series.idSeires,
        timeRecord: model.series.time,
        xp: model.series.xp,
        completed: model.series.completed,
        ratingSeries: model.series.ratingSeries,
        countUsersRating: model.series.countUsersRating,
        countUsers: model.series.countUsers,
      ),
      scene: ScenePuzzleUpdatesEntity(
        idScene: model.scene.idScene,
        time: model.scene.time,
        xp: model.scene.xp,
        completed: model.scene.completed,
        countUsers: model.scene.countUsers,
        recordTime: model.scene.recordTime,
      ),
      winner: WinnerPuzzleUpdatesEntity(
        idApp: model.winner.idApp,
        nick: model.winner.nick,
        logo: model.winner.logo,
        stat: StatWinnerPuzzleUpdatesEntity(
          position: model.winner.stat.position,
          time: model.winner.stat.time,
          xp: model.winner.stat.xp,
        ),
      ),
      viewUser: WinnerPuzzleUpdatesEntity(
        idApp: model.viewUser.idApp,
        nick: model.viewUser.nick,
        logo: model.viewUser.logo,
        stat: StatWinnerPuzzleUpdatesEntity(
          position: model.viewUser.stat.position,
          time: model.viewUser.stat.time,
          xp: model.viewUser.stat.xp,
          toNextTime: model.viewUser.stat.toNextTime ?? 0,
          toLastTime: model.viewUser.stat.toLastTime ?? 0,
        ),
      ),
    );
  }

  //
  static WinnersEntity setWinners(WinnersModel model) {
    return WinnersEntity(
      listWinner: model.listWinner.map((winner) {
        return ChampionsEntity(
          idApp: winner.idApp,
          nick: winner.nick,
          logo: winner.logo,
          stat: StatChampionEntity(
            position: winner.stat.position,
            time: winner.stat.time,
            xp: winner.stat.xp,
          ),
        );
      }).toList(),
      stat: model.stat == null
          ? null
          : StatAllChampionsEntity(
              min: MinMidMaxEntity(swipe: model.stat!.min.swipe, time: model.stat!.min.time),
              mid: MinMidMaxEntity(swipe: model.stat!.mid.swipe, time: model.stat!.mid.time),
              max: MinMidMaxEntity(swipe: model.stat!.max.swipe, time: model.stat!.max.time),
              graph: GraphEntity(
                countUsersMin: model.stat!.graph.countUsersMin,
                countUsersMax: model.stat!.graph.countUsersMax,
                countUsers: model.stat!.graph.countUsers,
                userStat: UserGraphStatEntity(
                  userState: model.stat!.graph.userStat.userState,
                  userTime: model.stat!.graph.userStat.userTime,
                  userCountSwipe: model.stat!.graph.userStat.userCountSwipe,
                ),
                userCountSwipe: model.stat!.graph.userCountSwipe,
                flexLeft: ((model.stat!.graph.countUsersMin * 100) / model.stat!.graph.countUsers).ceil(),
                flexRight: ((model.stat!.graph.countUsersMax * 100) / model.stat!.graph.countUsers).ceil(),
                xAxis: GAxisEntity(
                  interval: model.stat!.graph.xAxis.interval,
                  minLimit: model.stat!.graph.xAxis.minLimit,
                  maxLimit: model.stat!.graph.xAxis.maxLimit,
                ),
                yAxis: GAxisEntity(
                  interval: model.stat!.graph.yAxis.interval,
                  minLimit: model.stat!.graph.yAxis.minLimit,
                  maxLimit: model.stat!.graph.yAxis.maxLimit,
                ),
              ),
            ),
    );
  }
}
