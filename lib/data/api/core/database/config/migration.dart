import 'package:drift/drift.dart';
import 'package:facetomini/data/api/core/database/config/connect.dart';
// import 'package:flutter/foundation.dart';

/// Class for performing database migration using default data
abstract final class MigrationDataBaseDrift {
  // Migration databse
  static migration(ConnectDataBase db, {String? language}) {
    language ??= 'en';
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        await db.customStatement('PRAGMA foreign_keys = OFF');
        // Migration
        await db.transaction(() async {
          if (from < 2) {
            // await m.addColumn(todos, todos.dueDate);
          }
          if (from < 3) {
            // await m.addColumn(todos, todos.priority);
          }
        });
        // Assert that the schema is valid after migrations
        // if (kDebugMode) {
        // final wrongForeignKeys = await customSelect('PRAGMA foreign_key_check').get();
        // assert(wrongForeignKeys.isEmpty, '${wrongForeignKeys.map((e) => e.data)}');
        // }
      },
      beforeOpen: (details) async {
        await db.customStatement('PRAGMA foreign_keys = ON');
        if (details.wasCreated) {
          print(">> DataBase was created!!!");
          // Insert default data of app
          await db.batch((b) {
            // Add default app-user
            b.insert(db.useTableAppUser, UseTableAppUserCompanion.insert(publicKey: const Value("FaceTo_Mini_public_key")));
            // Add default app-settings
            b.insert(db.useTableAppSettings, UseTableAppSettingsCompanion.insert(language: Value(language!)));
            // Add default series
            b.insertAll(db.useTableSeries, _DefaultData.listSeries.map((e) {
              return UseTableSeriesCompanion.insert(
                idSeries: e.idSeries,
                idImage: e.idImage,
                typeView: e.typeView,
                // author
                idApp: e.idApp,
                nick: 'Maksim Tyunin',
                // view iser
                xp: 0,
                ratingUser: 0,
                completed: -1,
                favorites: 0,
                //
                typeTree: e.typeTree,
                hardLevel: e.hardLevel,
                //
                ratingSeries: 0,
                bestTime: e.bestTime,
                countUsersRating: 0,
                countUsers: 0,
                countScenes: e.countScenes,
              );
            }));
            // Add default scenes
            b.insertAll(db.useTableScenes, _DefaultData.listScenes.map((e) {
              return UseTableScenesCompanion.insert(
                idScene: e.idScene,
                idSeries: e.idSeries,
                idImage: e.idImage,
                typeView: e.typeView,
                idApp: e.idApp,
                xp: 0,
                grid: e.grid,
                countUsers: 0,
                recordTime: e.recordTime,
              );
            }));
          });
        }
      },
    );
  }
}

/// Class default data for database
abstract final class _DefaultData {
  static List<_Series> get listSeries => _listSeries.map((v) {
        return _Series(
          idSeries: v['id_series']!,
          idImage: v['id_image']!,
          typeView: v['type_view']!,
          idApp: v['id_app']!,
          typeTree: v['type_tree']!,
          hardLevel: v['diagonal']!,
          countScenes: v['count_scenes']!,
          bestTime: v['best_time']!,
        );
      }).toList();
  static List<_Scenes> get listScenes => _listScenes.map((v) {
        return _Scenes(
          idScene: v['id_scene']!,
          idSeries: v['id_series']!,
          idImage: v['id_image']!,
          typeView: v['type_view']!,
          idApp: v['id_app']!,
          grid: v['grid']!,
          recordTime: v['record_time']!,
        );
      }).toList();
  static final _listSeries = <Map<String, int>>[
    {'id_series': 41, 'id_image': 373, 'type_view': 1, 'id_app': 1, 'type_tree': 1, 'diagonal': 1, 'count_scenes': 8, 'best_time': 308180},
    {'id_series': 37, 'id_image': 343, 'type_view': 1, 'id_app': 17, 'type_tree': 2, 'diagonal': 1, 'count_scenes': 8, 'best_time': 328996},
    {'id_series': 29, 'id_image': 284, 'type_view': 1, 'id_app': 20, 'type_tree': 2, 'diagonal': 1, 'count_scenes': 7, 'best_time': 242750},
    {'id_series': 2, 'id_image': 16, 'type_view': 2, 'id_app': 13, 'type_tree': 2, 'diagonal': 1, 'count_scenes': 5, 'best_time': 231199},
    {'id_series': 1, 'id_image': 11, 'type_view': 2, 'id_app': 1, 'type_tree': 1, 'diagonal': 1, 'count_scenes': 5, 'best_time': 552282},
  ];

  static final _listScenes = <Map<String, dynamic>>[
    // series 1
    {'id_scene': 300, 'id_series': 41, 'id_image': 373, 'type_view': 1, 'id_app': 1, 'grid': '4x5', 'record_time': 24572},
    {'id_scene': 301, 'id_series': 41, 'id_image': 374, 'type_view': 2, 'id_app': 37, 'grid': '3x4', 'record_time': 18265},
    {'id_scene': 302, 'id_series': 41, 'id_image': 375, 'type_view': 1, 'id_app': 37, 'grid': '4x4', 'record_time': 21824},
    {'id_scene': 303, 'id_series': 41, 'id_image': 376, 'type_view': 1, 'id_app': 35, 'grid': '3x5', 'record_time': 17642},
    {'id_scene': 304, 'id_series': 41, 'id_image': 377, 'type_view': 1, 'id_app': 25, 'grid': '3x4', 'record_time': 25877},
    {'id_scene': 305, 'id_series': 41, 'id_image': 378, 'type_view': 1, 'id_app': 23, 'grid': '3x3', 'record_time': 42635},
    {'id_scene': 306, 'id_series': 41, 'id_image': 379, 'type_view': 1, 'id_app': 21, 'grid': '3x4', 'record_time': 81982},
    {'id_scene': 307, 'id_series': 41, 'id_image': 380, 'type_view': 1, 'id_app': 28, 'grid': '4x4', 'record_time': 32133},
    // series 2
    {'id_scene': 270, 'id_series': 37, 'id_image': 343, 'type_view': 1, 'id_app': 35, 'grid': '4x5', 'record_time': 63753},
    {'id_scene': 271, 'id_series': 37, 'id_image': 344, 'type_view': 1, 'id_app': 20, 'grid': '3x4', 'record_time': 22254},
    {'id_scene': 272, 'id_series': 37, 'id_image': 345, 'type_view': 2, 'id_app': 19, 'grid': '3x5', 'record_time': 46136},
    {'id_scene': 273, 'id_series': 37, 'id_image': 346, 'type_view': 2, 'id_app': 14, 'grid': '3x4', 'record_time': 23229},
    {'id_scene': 274, 'id_series': 37, 'id_image': 347, 'type_view': 2, 'id_app': 15, 'grid': '4x5', 'record_time': 87378},
    {'id_scene': 275, 'id_series': 37, 'id_image': 348, 'type_view': 1, 'id_app': 16, 'grid': '3x4', 'record_time': 35194},
    {'id_scene': 276, 'id_series': 37, 'id_image': 349, 'type_view': 1, 'id_app': 17, 'grid': '3x3', 'record_time': 48352},
    {'id_scene': 277, 'id_series': 37, 'id_image': 350, 'type_view': 2, 'id_app': 13, 'grid': '3x4', 'record_time': 57565},
    // sereis 3
    {'id_scene': 181, 'id_series': 29, 'id_image': 284, 'type_view': 1, 'id_app': 1, 'grid': '3x4', 'record_time': 18265},
    {'id_scene': 182, 'id_series': 29, 'id_image': 285, 'type_view': 1, 'id_app': 1, 'grid': '4x5', 'record_time': 21824},
    {'id_scene': 183, 'id_series': 29, 'id_image': 286, 'type_view': 2, 'id_app': 1, 'grid': '4x5', 'record_time': 25877},
    {'id_scene': 184, 'id_series': 29, 'id_image': 287, 'type_view': 1, 'id_app': 1, 'grid': '3x3', 'record_time': 32133},
    {'id_scene': 185, 'id_series': 29, 'id_image': 288, 'type_view': 2, 'id_app': 1, 'grid': '4x4', 'record_time': 46136},
    {'id_scene': 186, 'id_series': 29, 'id_image': 289, 'type_view': 2, 'id_app': 1, 'grid': '3x4', 'record_time': 87378},
    {'id_scene': 187, 'id_series': 29, 'id_image': 290, 'type_view': 2, 'id_app': 1, 'grid': '3x3', 'record_time': 48352},
    // series 4
    {'id_scene': 6, 'id_series': 2, 'id_image': 16, 'type_view': 2, 'id_app': 17, 'grid': '3x4', 'record_time': 42635},
    {'id_scene': 7, 'id_series': 2, 'id_image': 17, 'type_view': 2, 'id_app': 17, 'grid': '4x3', 'record_time': 81982},
    {'id_scene': 8, 'id_series': 2, 'id_image': 18, 'type_view': 2, 'id_app': 17, 'grid': '3x3', 'record_time': 32133},
    {'id_scene': 9, 'id_series': 2, 'id_image': 19, 'type_view': 2, 'id_app': 17, 'grid': '3x4', 'record_time': 97278},
    {'id_scene': 10, 'id_series': 2, 'id_image': 20, 'type_view': 2, 'id_app': 17, 'grid': '4x3', 'record_time': 74968},
    // series 5
    {'id_scene': 1, 'id_series': 1, 'id_image': 11, 'type_view': 2, 'id_app': 11, 'grid': '3x3', 'record_time': 24572},
    {'id_scene': 2, 'id_series': 1, 'id_image': 12, 'type_view': 2, 'id_app': 12, 'grid': '3x3', 'record_time': 18265},
    {'id_scene': 3, 'id_series': 1, 'id_image': 13, 'type_view': 2, 'id_app': 11, 'grid': '3x3', 'record_time': 21824},
    {'id_scene': 4, 'id_series': 1, 'id_image': 14, 'type_view': 2, 'id_app': 11, 'grid': '3x3', 'record_time': 17642},
    {'id_scene': 5, 'id_series': 1, 'id_image': 15, 'type_view': 2, 'id_app': 11, 'grid': '3x3', 'record_time': 25877},
  ];
}

class _Series {
  final int idSeries;
  final int idImage;
  final int typeView;
  final int idApp;
  final int typeTree;
  final int hardLevel;
  final int countScenes;
  final int bestTime;

  _Series({
    required this.idSeries,
    required this.idImage,
    required this.typeView,
    required this.idApp,
    required this.typeTree,
    required this.hardLevel,
    required this.countScenes,
    required this.bestTime,
  });
}

class _Scenes {
  final int idScene;
  final int idSeries;
  final int idImage;
  final int typeView;
  final int idApp;
  final String grid;
  final int recordTime;

  _Scenes({
    required this.idScene,
    required this.idSeries,
    required this.idImage,
    required this.typeView,
    required this.idApp,
    required this.grid,
    required this.recordTime,
  });
}
