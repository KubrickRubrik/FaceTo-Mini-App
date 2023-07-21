import 'package:facetomini/core/errors/exception.dart';
import 'package:facetomini/data/api/core/database/config/connect.dart';
import 'package:facetomini/data/api/core/database/queries/app.dart';
import 'package:facetomini/data/api/core/database/queries/scene.dart';
import 'package:facetomini/data/api/core/database/queries/series.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:facetomini/data/models/app.dart';

class ApiDbDrift implements ApiDbEnvelope {
  final _appQuery = AppQueryDrift();
  final _seriesQuery = SeriesQueryDrift();
  final _sceneQuery = SceneQueryDrift();

  // Authorization user
  @override
  Future<AuthorizedModel?> authorized() async {
    try {
      final apiDb = ConnectDataBase();
      final response = await _appQuery.authirized(apiDb);
      apiDb.close();
      if (response == null) return null;
      return AuthorizedModel(
        idApp: response.user.idApp,
        enabledSound: response.settings.enabledSound,
        language: response.settings.language,
        theme: response.settings.theme,
      );
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
