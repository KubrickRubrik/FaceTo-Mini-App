/// All available operation configurations for remote api
abstract final class ConfigActionsApi {
  static const linkServer = "http://ft-app.oyavi.com/api-mini.php";
  //! PageAuth
  static const seriesGet = "series.get";
  static const seriesUpdate = "series.update";
  //! Author
  static const authorGet = "author.get";
  //! WINNERS
  static const winnersSeriesGet = "winners.series.get";
  static const winnersSceneGet = "winners.scene.get";
  //! WINNER
  static const setWinnersScene = "winners.set";
}
