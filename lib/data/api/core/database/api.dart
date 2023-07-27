import 'package:facetomini/data/api/core/database/config/connect.dart';
import 'package:facetomini/data/api/core/database/queries/server.dart';
import 'package:facetomini/data/api/core/database/queries/session.dart';
import 'package:facetomini/data/api/core/database/queries/scenes.dart';
import 'package:facetomini/data/api/core/database/queries/series.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:facetomini/data/models/vo/scene.dart';
import 'package:facetomini/data/models/vo/series.dart';
import 'package:facetomini/data/models/vo/server.dart';
import 'package:facetomini/data/models/vo/session.dart';

final class ApiDbDrift implements ApiDbDAO {
  final _serverRequest = ServerRequestDrift();
  final _sessionRequest = SessionRequestDrift();
  final _seriesRequest = SeriesRequestDrift();
  final _scenesRequest = ScenesRequestDrift();
  final apiDb = ConnectDataBase();

  // Selecting the data required for a request to the server
  @override
  Future<ClientModel?> getClientData() async {
    final response = await _serverRequest.getServerData(apiDb);
    if (response == null) return null;
    return ClientModel(
      idApp: response.user.idApp,
      publicKey: response.user.publicKey,
      language: response.settings.language,
    );
  }

  // Authorization user
  @override
  Future<SessionModel?> authorized(String languageName) async {
    final response = await _sessionRequest.authirized(apiDb);
    if (response == null) return null;
    return SessionModel(
      idApp: response.user.idApp,
      enabledSound: response.settings.enabledSound,
      language: response.settings.language,
      theme: response.settings.theme,
    );
  }

  // Save a theme
  @override
  Future<SessionModel?> setTheme(String themeName) async {
    final response = await _sessionRequest.setTheme(apiDb, theme: themeName);
    if (response == null) return null;
    return SessionModel.settings(theme: response.theme);
  }

  // Locale saving
  @override
  Future<SessionModel?> setLocale(String languageName) async {
    final response = await _sessionRequest.setLocale(apiDb, language: languageName);
    if (response == null) return null;
    return SessionModel.settings(language: response.language);
  }

  // Saving sound
  @override
  Future<SessionModel?> setSound(bool enebledSound) async {
    final response = await _sessionRequest.setSound(apiDb, enebledSound: enebledSound);
    if (response == null) return null;
    return SessionModel.settings(enabledSound: response.enabledSound);
  }

  // Get series
  @override
  Future<List<SeriesModel>?> getSeries() async {
    final response = await _seriesRequest.getSeries(apiDb);
    if (response == null) return null;
    final result = response.map((e) => SeriesModel(e)).toList();
    return result;
  }

  // Get scenes
  @override
  Future<List<SceneModel>?> getScenesInSeries(int idSeries) async {
    final response = await _scenesRequest.getScenesInSeries(apiDb, idSeries: idSeries);
    if (response == null) return null;
    final result = response.map((e) => SceneModel(e.scene, e.typeTree)).toList();
    return result;
  }
}

// return (update(todos)
//       ..where((t) => t.title.like('%Important%'))
//     ).write(TodosCompanion(
//       category: Value(target.id),
//     ),
//   );

//  return (delete(todos)..where((t) => t.id.isSmallerThanValue(10))).go();

//  return update(todos).replace(entry);

// Future<int> addTodo(TodosCompanion entry) {
//   return into(todos).insert(entry);
// }

// return into(users).insertOnConflictUpdate(user);

// return into(words).insert(
//     WordsCompanion.insert(word: word),
//     onConflict: DoUpdate((old) => WordsCompanion.custom(usages: old.usages + Constant(1))),
//   );
// addTodo(
//   TodosCompanion(
//     title: Value('Important task'),
//     content: Value('Refactor persistence code'),
//   ),
// );

//! Множественная вставка
// await batch((batch) {
//   // functions in a batch don't have to be awaited - just
//   // await the whole batch afterwards.
//   batch.insertAll(todos, [
//     TodosCompanion.insert(
//       title: 'First entry',
//       content: 'My content',
//     ),
//     TodosCompanion.insert(
//       title: 'Another entry',
//       content: 'More content',
//       // columns that aren't required for inserts are still wrapped in a Value:
//       category: Value(3),
//     ),
//     // ...
//   ]);
// });

//! Insert c возвратом
//   final row = await into(todos).insertReturning(TodosCompanion.insert(
//   title: 'A todo entry',
//   content: 'A description',
// ));
