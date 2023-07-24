import 'package:facetomini/core/errors/exception.dart';
import 'package:facetomini/data/api/core/database/config/connect.dart';
import 'package:facetomini/data/api/core/database/queries/session.dart';
import 'package:facetomini/data/api/core/database/queries/scene.dart';
import 'package:facetomini/data/api/core/database/queries/series.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:facetomini/data/models/session.dart';

class ApiDbDrift implements ApiDbEnvelope {
  final _sessionQuery = SessionQueryDrift();
  final _seriesQuery = SeriesQueryDrift();
  final _sceneQuery = SceneQueryDrift();

  // Authorization user
  @override
  Future<SessionModel?> authorized(String languageName) async {
    try {
      final apiDb = ConnectDataBase(language: languageName);
      final response = await _sessionQuery.authirized(apiDb);
      apiDb.close();
      if (response == null) return null;
      return SessionModel(
        idApp: response.user.idApp,
        enabledSound: response.settings.enabledSound,
        language: response.settings.language,
        theme: response.settings.theme,
      );
    } catch (e) {
      throw ApiException('Exception api database drift $e');
    }
  }

  // Save a theme
  @override
  Future<SessionModel?> setTheme(String themeName) async {
    try {
      final apiDb = ConnectDataBase();
      final response = await _sessionQuery.setTheme(apiDb, theme: themeName);
      apiDb.close();
      if (response == null) return null;
      return SessionModel.settings(theme: response.theme);
    } catch (e) {
      throw ApiException('Exception api database drift $e');
    }
  }

  // Locale saving
  @override
  Future<SessionModel?> setLocale(String languageName) async {
    try {
      final apiDb = ConnectDataBase();
      final response = await _sessionQuery.setLocale(apiDb, language: languageName);
      apiDb.close();
      if (response == null) return null;
      return SessionModel.settings(language: response.language);
    } catch (e) {
      throw ApiException('Exception api database drift $e');
    }
  }

  // Saving sound
  @override
  Future<SessionModel?> setSound(bool enebledSound) async {
    try {
      final apiDb = ConnectDataBase();
      final response = await _sessionQuery.setSound(apiDb, enebledSound: enebledSound);
      apiDb.close();
      if (response == null) return null;
      return SessionModel.settings(enabledSound: response.enabledSound);
    } catch (e) {
      throw ApiException('Exception api database drift $e');
    }
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
