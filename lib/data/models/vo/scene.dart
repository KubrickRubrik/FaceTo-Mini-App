import 'package:facetomini/data/api/core/database/config/connect.dart';

final class SceneModel {
  final int id;
  final int idScene;
  final int idSeries;
  final int idImage;
  final int typeView;
  final int idApp;
  final int xp;
  final int completed;
  final String grid;
  final int countUsers;
  final int recordTime;
  //
  final int typeTree;

  SceneModel(TableScenes tb, this.typeTree)
      : id = tb.id,
        idScene = tb.idScene,
        idSeries = tb.idSeries,
        idImage = tb.idImage,
        typeView = tb.typeView,
        idApp = tb.idApp,
        xp = tb.xp,
        completed = tb.completed,
        grid = tb.grid,
        countUsers = tb.countUsers,
        recordTime = tb.recordTime;
}
