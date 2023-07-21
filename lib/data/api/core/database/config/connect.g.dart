// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect.dart';

// ignore_for_file: type=lint
class $UseTableAppUserTable extends UseTableAppUser
    with TableInfo<$UseTableAppUserTable, TableAppUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UseTableAppUserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idAppMeta = const VerificationMeta('idApp');
  @override
  late final GeneratedColumn<int> idApp = GeneratedColumn<int>(
      'id_app', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns => [id, idApp];
  @override
  String get aliasedName => _alias ?? 'use_table_app_user';
  @override
  String get actualTableName => 'use_table_app_user';
  @override
  VerificationContext validateIntegrity(Insertable<TableAppUser> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_app')) {
      context.handle(
          _idAppMeta, idApp.isAcceptableOrUnknown(data['id_app']!, _idAppMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TableAppUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TableAppUser(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idApp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_app'])!,
    );
  }

  @override
  $UseTableAppUserTable createAlias(String alias) {
    return $UseTableAppUserTable(attachedDatabase, alias);
  }
}

class TableAppUser extends DataClass implements Insertable<TableAppUser> {
  final int id;
  final int idApp;
  const TableAppUser({required this.id, required this.idApp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_app'] = Variable<int>(idApp);
    return map;
  }

  UseTableAppUserCompanion toCompanion(bool nullToAbsent) {
    return UseTableAppUserCompanion(
      id: Value(id),
      idApp: Value(idApp),
    );
  }

  factory TableAppUser.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TableAppUser(
      id: serializer.fromJson<int>(json['id']),
      idApp: serializer.fromJson<int>(json['idApp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idApp': serializer.toJson<int>(idApp),
    };
  }

  TableAppUser copyWith({int? id, int? idApp}) => TableAppUser(
        id: id ?? this.id,
        idApp: idApp ?? this.idApp,
      );
  @override
  String toString() {
    return (StringBuffer('TableAppUser(')
          ..write('id: $id, ')
          ..write('idApp: $idApp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idApp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableAppUser &&
          other.id == this.id &&
          other.idApp == this.idApp);
}

class UseTableAppUserCompanion extends UpdateCompanion<TableAppUser> {
  final Value<int> id;
  final Value<int> idApp;
  const UseTableAppUserCompanion({
    this.id = const Value.absent(),
    this.idApp = const Value.absent(),
  });
  UseTableAppUserCompanion.insert({
    this.id = const Value.absent(),
    this.idApp = const Value.absent(),
  });
  static Insertable<TableAppUser> custom({
    Expression<int>? id,
    Expression<int>? idApp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idApp != null) 'id_app': idApp,
    });
  }

  UseTableAppUserCompanion copyWith({Value<int>? id, Value<int>? idApp}) {
    return UseTableAppUserCompanion(
      id: id ?? this.id,
      idApp: idApp ?? this.idApp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idApp.present) {
      map['id_app'] = Variable<int>(idApp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UseTableAppUserCompanion(')
          ..write('id: $id, ')
          ..write('idApp: $idApp')
          ..write(')'))
        .toString();
  }
}

class $UseTableAppSettingsTable extends UseTableAppSettings
    with TableInfo<$UseTableAppSettingsTable, TableAppSettings> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UseTableAppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idAppMeta = const VerificationMeta('idApp');
  @override
  late final GeneratedColumn<int> idApp = GeneratedColumn<int>(
      'id_app', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _enabledSoundMeta =
      const VerificationMeta('enabledSound');
  @override
  late final GeneratedColumn<int> enabledSound = GeneratedColumn<int>(
      'enabled_sound', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('ru'));
  static const VerificationMeta _themeMeta = const VerificationMeta('theme');
  @override
  late final GeneratedColumn<String> theme = GeneratedColumn<String>(
      'theme', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('light'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, idApp, enabledSound, language, theme];
  @override
  String get aliasedName => _alias ?? 'use_table_app_settings';
  @override
  String get actualTableName => 'use_table_app_settings';
  @override
  VerificationContext validateIntegrity(Insertable<TableAppSettings> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_app')) {
      context.handle(
          _idAppMeta, idApp.isAcceptableOrUnknown(data['id_app']!, _idAppMeta));
    }
    if (data.containsKey('enabled_sound')) {
      context.handle(
          _enabledSoundMeta,
          enabledSound.isAcceptableOrUnknown(
              data['enabled_sound']!, _enabledSoundMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('theme')) {
      context.handle(
          _themeMeta, theme.isAcceptableOrUnknown(data['theme']!, _themeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TableAppSettings map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TableAppSettings(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idApp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_app'])!,
      enabledSound: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}enabled_sound'])!,
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
      theme: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme'])!,
    );
  }

  @override
  $UseTableAppSettingsTable createAlias(String alias) {
    return $UseTableAppSettingsTable(attachedDatabase, alias);
  }
}

class TableAppSettings extends DataClass
    implements Insertable<TableAppSettings> {
  final int id;
  final int idApp;
  final int enabledSound;
  final String language;
  final String theme;
  const TableAppSettings(
      {required this.id,
      required this.idApp,
      required this.enabledSound,
      required this.language,
      required this.theme});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_app'] = Variable<int>(idApp);
    map['enabled_sound'] = Variable<int>(enabledSound);
    map['language'] = Variable<String>(language);
    map['theme'] = Variable<String>(theme);
    return map;
  }

  UseTableAppSettingsCompanion toCompanion(bool nullToAbsent) {
    return UseTableAppSettingsCompanion(
      id: Value(id),
      idApp: Value(idApp),
      enabledSound: Value(enabledSound),
      language: Value(language),
      theme: Value(theme),
    );
  }

  factory TableAppSettings.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TableAppSettings(
      id: serializer.fromJson<int>(json['id']),
      idApp: serializer.fromJson<int>(json['idApp']),
      enabledSound: serializer.fromJson<int>(json['enabledSound']),
      language: serializer.fromJson<String>(json['language']),
      theme: serializer.fromJson<String>(json['theme']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idApp': serializer.toJson<int>(idApp),
      'enabledSound': serializer.toJson<int>(enabledSound),
      'language': serializer.toJson<String>(language),
      'theme': serializer.toJson<String>(theme),
    };
  }

  TableAppSettings copyWith(
          {int? id,
          int? idApp,
          int? enabledSound,
          String? language,
          String? theme}) =>
      TableAppSettings(
        id: id ?? this.id,
        idApp: idApp ?? this.idApp,
        enabledSound: enabledSound ?? this.enabledSound,
        language: language ?? this.language,
        theme: theme ?? this.theme,
      );
  @override
  String toString() {
    return (StringBuffer('TableAppSettings(')
          ..write('id: $id, ')
          ..write('idApp: $idApp, ')
          ..write('enabledSound: $enabledSound, ')
          ..write('language: $language, ')
          ..write('theme: $theme')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idApp, enabledSound, language, theme);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableAppSettings &&
          other.id == this.id &&
          other.idApp == this.idApp &&
          other.enabledSound == this.enabledSound &&
          other.language == this.language &&
          other.theme == this.theme);
}

class UseTableAppSettingsCompanion extends UpdateCompanion<TableAppSettings> {
  final Value<int> id;
  final Value<int> idApp;
  final Value<int> enabledSound;
  final Value<String> language;
  final Value<String> theme;
  const UseTableAppSettingsCompanion({
    this.id = const Value.absent(),
    this.idApp = const Value.absent(),
    this.enabledSound = const Value.absent(),
    this.language = const Value.absent(),
    this.theme = const Value.absent(),
  });
  UseTableAppSettingsCompanion.insert({
    this.id = const Value.absent(),
    this.idApp = const Value.absent(),
    this.enabledSound = const Value.absent(),
    this.language = const Value.absent(),
    this.theme = const Value.absent(),
  });
  static Insertable<TableAppSettings> custom({
    Expression<int>? id,
    Expression<int>? idApp,
    Expression<int>? enabledSound,
    Expression<String>? language,
    Expression<String>? theme,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idApp != null) 'id_app': idApp,
      if (enabledSound != null) 'enabled_sound': enabledSound,
      if (language != null) 'language': language,
      if (theme != null) 'theme': theme,
    });
  }

  UseTableAppSettingsCompanion copyWith(
      {Value<int>? id,
      Value<int>? idApp,
      Value<int>? enabledSound,
      Value<String>? language,
      Value<String>? theme}) {
    return UseTableAppSettingsCompanion(
      id: id ?? this.id,
      idApp: idApp ?? this.idApp,
      enabledSound: enabledSound ?? this.enabledSound,
      language: language ?? this.language,
      theme: theme ?? this.theme,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idApp.present) {
      map['id_app'] = Variable<int>(idApp.value);
    }
    if (enabledSound.present) {
      map['enabled_sound'] = Variable<int>(enabledSound.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (theme.present) {
      map['theme'] = Variable<String>(theme.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UseTableAppSettingsCompanion(')
          ..write('id: $id, ')
          ..write('idApp: $idApp, ')
          ..write('enabledSound: $enabledSound, ')
          ..write('language: $language, ')
          ..write('theme: $theme')
          ..write(')'))
        .toString();
  }
}

class $UseTableSeriesTable extends UseTableSeries
    with TableInfo<$UseTableSeriesTable, TableSeries> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UseTableSeriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idSeriesMeta =
      const VerificationMeta('idSeries');
  @override
  late final GeneratedColumn<int> idSeries = GeneratedColumn<int>(
      'id_series', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _typeViewMeta =
      const VerificationMeta('typeView');
  @override
  late final GeneratedColumn<int> typeView = GeneratedColumn<int>(
      'type_view', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _idAppMeta = const VerificationMeta('idApp');
  @override
  late final GeneratedColumn<int> idApp = GeneratedColumn<int>(
      'id_app', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nickMeta = const VerificationMeta('nick');
  @override
  late final GeneratedColumn<String> nick = GeneratedColumn<String>(
      'nick_app', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _xpMeta = const VerificationMeta('xp');
  @override
  late final GeneratedColumn<int> xp = GeneratedColumn<int>(
      'xp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
      'rating', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _completedMeta =
      const VerificationMeta('completed');
  @override
  late final GeneratedColumn<int> completed = GeneratedColumn<int>(
      'completed', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _favoritesMeta =
      const VerificationMeta('favorites');
  @override
  late final GeneratedColumn<int> favorites = GeneratedColumn<int>(
      'favorites', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeTreeMeta =
      const VerificationMeta('typeTree');
  @override
  late final GeneratedColumn<int> typeTree = GeneratedColumn<int>(
      'type_tree', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _hardLevelMeta =
      const VerificationMeta('hardLevel');
  @override
  late final GeneratedColumn<int> hardLevel = GeneratedColumn<int>(
      'hard_level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _bestTimeMeta =
      const VerificationMeta('bestTime');
  @override
  late final GeneratedColumn<int> bestTime = GeneratedColumn<int>(
      'best_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ratingSeriesMeta =
      const VerificationMeta('ratingSeries');
  @override
  late final GeneratedColumn<int> ratingSeries = GeneratedColumn<int>(
      'rating_series', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _countUsersRatingMeta =
      const VerificationMeta('countUsersRating');
  @override
  late final GeneratedColumn<int> countUsersRating = GeneratedColumn<int>(
      'count_users_rating', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _countUsersMeta =
      const VerificationMeta('countUsers');
  @override
  late final GeneratedColumn<int> countUsers = GeneratedColumn<int>(
      'count_users', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _countScenesMeta =
      const VerificationMeta('countScenes');
  @override
  late final GeneratedColumn<int> countScenes = GeneratedColumn<int>(
      'count_scenes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idSeries,
        typeView,
        idApp,
        nick,
        xp,
        rating,
        completed,
        favorites,
        typeTree,
        hardLevel,
        bestTime,
        ratingSeries,
        countUsersRating,
        countUsers,
        countScenes
      ];
  @override
  String get aliasedName => _alias ?? 'use_table_series';
  @override
  String get actualTableName => 'use_table_series';
  @override
  VerificationContext validateIntegrity(Insertable<TableSeries> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_series')) {
      context.handle(_idSeriesMeta,
          idSeries.isAcceptableOrUnknown(data['id_series']!, _idSeriesMeta));
    } else if (isInserting) {
      context.missing(_idSeriesMeta);
    }
    if (data.containsKey('type_view')) {
      context.handle(_typeViewMeta,
          typeView.isAcceptableOrUnknown(data['type_view']!, _typeViewMeta));
    } else if (isInserting) {
      context.missing(_typeViewMeta);
    }
    if (data.containsKey('id_app')) {
      context.handle(
          _idAppMeta, idApp.isAcceptableOrUnknown(data['id_app']!, _idAppMeta));
    } else if (isInserting) {
      context.missing(_idAppMeta);
    }
    if (data.containsKey('nick_app')) {
      context.handle(
          _nickMeta, nick.isAcceptableOrUnknown(data['nick_app']!, _nickMeta));
    } else if (isInserting) {
      context.missing(_nickMeta);
    }
    if (data.containsKey('xp')) {
      context.handle(_xpMeta, xp.isAcceptableOrUnknown(data['xp']!, _xpMeta));
    } else if (isInserting) {
      context.missing(_xpMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    } else if (isInserting) {
      context.missing(_completedMeta);
    }
    if (data.containsKey('favorites')) {
      context.handle(_favoritesMeta,
          favorites.isAcceptableOrUnknown(data['favorites']!, _favoritesMeta));
    } else if (isInserting) {
      context.missing(_favoritesMeta);
    }
    if (data.containsKey('type_tree')) {
      context.handle(_typeTreeMeta,
          typeTree.isAcceptableOrUnknown(data['type_tree']!, _typeTreeMeta));
    } else if (isInserting) {
      context.missing(_typeTreeMeta);
    }
    if (data.containsKey('hard_level')) {
      context.handle(_hardLevelMeta,
          hardLevel.isAcceptableOrUnknown(data['hard_level']!, _hardLevelMeta));
    } else if (isInserting) {
      context.missing(_hardLevelMeta);
    }
    if (data.containsKey('best_time')) {
      context.handle(_bestTimeMeta,
          bestTime.isAcceptableOrUnknown(data['best_time']!, _bestTimeMeta));
    } else if (isInserting) {
      context.missing(_bestTimeMeta);
    }
    if (data.containsKey('rating_series')) {
      context.handle(
          _ratingSeriesMeta,
          ratingSeries.isAcceptableOrUnknown(
              data['rating_series']!, _ratingSeriesMeta));
    } else if (isInserting) {
      context.missing(_ratingSeriesMeta);
    }
    if (data.containsKey('count_users_rating')) {
      context.handle(
          _countUsersRatingMeta,
          countUsersRating.isAcceptableOrUnknown(
              data['count_users_rating']!, _countUsersRatingMeta));
    } else if (isInserting) {
      context.missing(_countUsersRatingMeta);
    }
    if (data.containsKey('count_users')) {
      context.handle(
          _countUsersMeta,
          countUsers.isAcceptableOrUnknown(
              data['count_users']!, _countUsersMeta));
    } else if (isInserting) {
      context.missing(_countUsersMeta);
    }
    if (data.containsKey('count_scenes')) {
      context.handle(
          _countScenesMeta,
          countScenes.isAcceptableOrUnknown(
              data['count_scenes']!, _countScenesMeta));
    } else if (isInserting) {
      context.missing(_countScenesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TableSeries map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TableSeries(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idSeries: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_series'])!,
      typeView: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_view'])!,
      idApp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_app'])!,
      nick: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nick_app'])!,
      xp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}xp'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rating'])!,
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}completed'])!,
      favorites: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}favorites'])!,
      typeTree: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_tree'])!,
      hardLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hard_level'])!,
      bestTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}best_time'])!,
      ratingSeries: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rating_series'])!,
      countUsersRating: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}count_users_rating'])!,
      countUsers: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count_users'])!,
      countScenes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count_scenes'])!,
    );
  }

  @override
  $UseTableSeriesTable createAlias(String alias) {
    return $UseTableSeriesTable(attachedDatabase, alias);
  }
}

class TableSeries extends DataClass implements Insertable<TableSeries> {
  final int id;
  final int idSeries;
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
  const TableSeries(
      {required this.id,
      required this.idSeries,
      required this.typeView,
      required this.idApp,
      required this.nick,
      required this.xp,
      required this.rating,
      required this.completed,
      required this.favorites,
      required this.typeTree,
      required this.hardLevel,
      required this.bestTime,
      required this.ratingSeries,
      required this.countUsersRating,
      required this.countUsers,
      required this.countScenes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_series'] = Variable<int>(idSeries);
    map['type_view'] = Variable<int>(typeView);
    map['id_app'] = Variable<int>(idApp);
    map['nick_app'] = Variable<String>(nick);
    map['xp'] = Variable<int>(xp);
    map['rating'] = Variable<int>(rating);
    map['completed'] = Variable<int>(completed);
    map['favorites'] = Variable<int>(favorites);
    map['type_tree'] = Variable<int>(typeTree);
    map['hard_level'] = Variable<int>(hardLevel);
    map['best_time'] = Variable<int>(bestTime);
    map['rating_series'] = Variable<int>(ratingSeries);
    map['count_users_rating'] = Variable<int>(countUsersRating);
    map['count_users'] = Variable<int>(countUsers);
    map['count_scenes'] = Variable<int>(countScenes);
    return map;
  }

  UseTableSeriesCompanion toCompanion(bool nullToAbsent) {
    return UseTableSeriesCompanion(
      id: Value(id),
      idSeries: Value(idSeries),
      typeView: Value(typeView),
      idApp: Value(idApp),
      nick: Value(nick),
      xp: Value(xp),
      rating: Value(rating),
      completed: Value(completed),
      favorites: Value(favorites),
      typeTree: Value(typeTree),
      hardLevel: Value(hardLevel),
      bestTime: Value(bestTime),
      ratingSeries: Value(ratingSeries),
      countUsersRating: Value(countUsersRating),
      countUsers: Value(countUsers),
      countScenes: Value(countScenes),
    );
  }

  factory TableSeries.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TableSeries(
      id: serializer.fromJson<int>(json['id']),
      idSeries: serializer.fromJson<int>(json['idSeries']),
      typeView: serializer.fromJson<int>(json['typeView']),
      idApp: serializer.fromJson<int>(json['idApp']),
      nick: serializer.fromJson<String>(json['nick']),
      xp: serializer.fromJson<int>(json['xp']),
      rating: serializer.fromJson<int>(json['rating']),
      completed: serializer.fromJson<int>(json['completed']),
      favorites: serializer.fromJson<int>(json['favorites']),
      typeTree: serializer.fromJson<int>(json['typeTree']),
      hardLevel: serializer.fromJson<int>(json['hardLevel']),
      bestTime: serializer.fromJson<int>(json['bestTime']),
      ratingSeries: serializer.fromJson<int>(json['ratingSeries']),
      countUsersRating: serializer.fromJson<int>(json['countUsersRating']),
      countUsers: serializer.fromJson<int>(json['countUsers']),
      countScenes: serializer.fromJson<int>(json['countScenes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idSeries': serializer.toJson<int>(idSeries),
      'typeView': serializer.toJson<int>(typeView),
      'idApp': serializer.toJson<int>(idApp),
      'nick': serializer.toJson<String>(nick),
      'xp': serializer.toJson<int>(xp),
      'rating': serializer.toJson<int>(rating),
      'completed': serializer.toJson<int>(completed),
      'favorites': serializer.toJson<int>(favorites),
      'typeTree': serializer.toJson<int>(typeTree),
      'hardLevel': serializer.toJson<int>(hardLevel),
      'bestTime': serializer.toJson<int>(bestTime),
      'ratingSeries': serializer.toJson<int>(ratingSeries),
      'countUsersRating': serializer.toJson<int>(countUsersRating),
      'countUsers': serializer.toJson<int>(countUsers),
      'countScenes': serializer.toJson<int>(countScenes),
    };
  }

  TableSeries copyWith(
          {int? id,
          int? idSeries,
          int? typeView,
          int? idApp,
          String? nick,
          int? xp,
          int? rating,
          int? completed,
          int? favorites,
          int? typeTree,
          int? hardLevel,
          int? bestTime,
          int? ratingSeries,
          int? countUsersRating,
          int? countUsers,
          int? countScenes}) =>
      TableSeries(
        id: id ?? this.id,
        idSeries: idSeries ?? this.idSeries,
        typeView: typeView ?? this.typeView,
        idApp: idApp ?? this.idApp,
        nick: nick ?? this.nick,
        xp: xp ?? this.xp,
        rating: rating ?? this.rating,
        completed: completed ?? this.completed,
        favorites: favorites ?? this.favorites,
        typeTree: typeTree ?? this.typeTree,
        hardLevel: hardLevel ?? this.hardLevel,
        bestTime: bestTime ?? this.bestTime,
        ratingSeries: ratingSeries ?? this.ratingSeries,
        countUsersRating: countUsersRating ?? this.countUsersRating,
        countUsers: countUsers ?? this.countUsers,
        countScenes: countScenes ?? this.countScenes,
      );
  @override
  String toString() {
    return (StringBuffer('TableSeries(')
          ..write('id: $id, ')
          ..write('idSeries: $idSeries, ')
          ..write('typeView: $typeView, ')
          ..write('idApp: $idApp, ')
          ..write('nick: $nick, ')
          ..write('xp: $xp, ')
          ..write('rating: $rating, ')
          ..write('completed: $completed, ')
          ..write('favorites: $favorites, ')
          ..write('typeTree: $typeTree, ')
          ..write('hardLevel: $hardLevel, ')
          ..write('bestTime: $bestTime, ')
          ..write('ratingSeries: $ratingSeries, ')
          ..write('countUsersRating: $countUsersRating, ')
          ..write('countUsers: $countUsers, ')
          ..write('countScenes: $countScenes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      idSeries,
      typeView,
      idApp,
      nick,
      xp,
      rating,
      completed,
      favorites,
      typeTree,
      hardLevel,
      bestTime,
      ratingSeries,
      countUsersRating,
      countUsers,
      countScenes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableSeries &&
          other.id == this.id &&
          other.idSeries == this.idSeries &&
          other.typeView == this.typeView &&
          other.idApp == this.idApp &&
          other.nick == this.nick &&
          other.xp == this.xp &&
          other.rating == this.rating &&
          other.completed == this.completed &&
          other.favorites == this.favorites &&
          other.typeTree == this.typeTree &&
          other.hardLevel == this.hardLevel &&
          other.bestTime == this.bestTime &&
          other.ratingSeries == this.ratingSeries &&
          other.countUsersRating == this.countUsersRating &&
          other.countUsers == this.countUsers &&
          other.countScenes == this.countScenes);
}

class UseTableSeriesCompanion extends UpdateCompanion<TableSeries> {
  final Value<int> id;
  final Value<int> idSeries;
  final Value<int> typeView;
  final Value<int> idApp;
  final Value<String> nick;
  final Value<int> xp;
  final Value<int> rating;
  final Value<int> completed;
  final Value<int> favorites;
  final Value<int> typeTree;
  final Value<int> hardLevel;
  final Value<int> bestTime;
  final Value<int> ratingSeries;
  final Value<int> countUsersRating;
  final Value<int> countUsers;
  final Value<int> countScenes;
  const UseTableSeriesCompanion({
    this.id = const Value.absent(),
    this.idSeries = const Value.absent(),
    this.typeView = const Value.absent(),
    this.idApp = const Value.absent(),
    this.nick = const Value.absent(),
    this.xp = const Value.absent(),
    this.rating = const Value.absent(),
    this.completed = const Value.absent(),
    this.favorites = const Value.absent(),
    this.typeTree = const Value.absent(),
    this.hardLevel = const Value.absent(),
    this.bestTime = const Value.absent(),
    this.ratingSeries = const Value.absent(),
    this.countUsersRating = const Value.absent(),
    this.countUsers = const Value.absent(),
    this.countScenes = const Value.absent(),
  });
  UseTableSeriesCompanion.insert({
    this.id = const Value.absent(),
    required int idSeries,
    required int typeView,
    required int idApp,
    required String nick,
    required int xp,
    required int rating,
    required int completed,
    required int favorites,
    required int typeTree,
    required int hardLevel,
    required int bestTime,
    required int ratingSeries,
    required int countUsersRating,
    required int countUsers,
    required int countScenes,
  })  : idSeries = Value(idSeries),
        typeView = Value(typeView),
        idApp = Value(idApp),
        nick = Value(nick),
        xp = Value(xp),
        rating = Value(rating),
        completed = Value(completed),
        favorites = Value(favorites),
        typeTree = Value(typeTree),
        hardLevel = Value(hardLevel),
        bestTime = Value(bestTime),
        ratingSeries = Value(ratingSeries),
        countUsersRating = Value(countUsersRating),
        countUsers = Value(countUsers),
        countScenes = Value(countScenes);
  static Insertable<TableSeries> custom({
    Expression<int>? id,
    Expression<int>? idSeries,
    Expression<int>? typeView,
    Expression<int>? idApp,
    Expression<String>? nick,
    Expression<int>? xp,
    Expression<int>? rating,
    Expression<int>? completed,
    Expression<int>? favorites,
    Expression<int>? typeTree,
    Expression<int>? hardLevel,
    Expression<int>? bestTime,
    Expression<int>? ratingSeries,
    Expression<int>? countUsersRating,
    Expression<int>? countUsers,
    Expression<int>? countScenes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idSeries != null) 'id_series': idSeries,
      if (typeView != null) 'type_view': typeView,
      if (idApp != null) 'id_app': idApp,
      if (nick != null) 'nick_app': nick,
      if (xp != null) 'xp': xp,
      if (rating != null) 'rating': rating,
      if (completed != null) 'completed': completed,
      if (favorites != null) 'favorites': favorites,
      if (typeTree != null) 'type_tree': typeTree,
      if (hardLevel != null) 'hard_level': hardLevel,
      if (bestTime != null) 'best_time': bestTime,
      if (ratingSeries != null) 'rating_series': ratingSeries,
      if (countUsersRating != null) 'count_users_rating': countUsersRating,
      if (countUsers != null) 'count_users': countUsers,
      if (countScenes != null) 'count_scenes': countScenes,
    });
  }

  UseTableSeriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? idSeries,
      Value<int>? typeView,
      Value<int>? idApp,
      Value<String>? nick,
      Value<int>? xp,
      Value<int>? rating,
      Value<int>? completed,
      Value<int>? favorites,
      Value<int>? typeTree,
      Value<int>? hardLevel,
      Value<int>? bestTime,
      Value<int>? ratingSeries,
      Value<int>? countUsersRating,
      Value<int>? countUsers,
      Value<int>? countScenes}) {
    return UseTableSeriesCompanion(
      id: id ?? this.id,
      idSeries: idSeries ?? this.idSeries,
      typeView: typeView ?? this.typeView,
      idApp: idApp ?? this.idApp,
      nick: nick ?? this.nick,
      xp: xp ?? this.xp,
      rating: rating ?? this.rating,
      completed: completed ?? this.completed,
      favorites: favorites ?? this.favorites,
      typeTree: typeTree ?? this.typeTree,
      hardLevel: hardLevel ?? this.hardLevel,
      bestTime: bestTime ?? this.bestTime,
      ratingSeries: ratingSeries ?? this.ratingSeries,
      countUsersRating: countUsersRating ?? this.countUsersRating,
      countUsers: countUsers ?? this.countUsers,
      countScenes: countScenes ?? this.countScenes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idSeries.present) {
      map['id_series'] = Variable<int>(idSeries.value);
    }
    if (typeView.present) {
      map['type_view'] = Variable<int>(typeView.value);
    }
    if (idApp.present) {
      map['id_app'] = Variable<int>(idApp.value);
    }
    if (nick.present) {
      map['nick_app'] = Variable<String>(nick.value);
    }
    if (xp.present) {
      map['xp'] = Variable<int>(xp.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (completed.present) {
      map['completed'] = Variable<int>(completed.value);
    }
    if (favorites.present) {
      map['favorites'] = Variable<int>(favorites.value);
    }
    if (typeTree.present) {
      map['type_tree'] = Variable<int>(typeTree.value);
    }
    if (hardLevel.present) {
      map['hard_level'] = Variable<int>(hardLevel.value);
    }
    if (bestTime.present) {
      map['best_time'] = Variable<int>(bestTime.value);
    }
    if (ratingSeries.present) {
      map['rating_series'] = Variable<int>(ratingSeries.value);
    }
    if (countUsersRating.present) {
      map['count_users_rating'] = Variable<int>(countUsersRating.value);
    }
    if (countUsers.present) {
      map['count_users'] = Variable<int>(countUsers.value);
    }
    if (countScenes.present) {
      map['count_scenes'] = Variable<int>(countScenes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UseTableSeriesCompanion(')
          ..write('id: $id, ')
          ..write('idSeries: $idSeries, ')
          ..write('typeView: $typeView, ')
          ..write('idApp: $idApp, ')
          ..write('nick: $nick, ')
          ..write('xp: $xp, ')
          ..write('rating: $rating, ')
          ..write('completed: $completed, ')
          ..write('favorites: $favorites, ')
          ..write('typeTree: $typeTree, ')
          ..write('hardLevel: $hardLevel, ')
          ..write('bestTime: $bestTime, ')
          ..write('ratingSeries: $ratingSeries, ')
          ..write('countUsersRating: $countUsersRating, ')
          ..write('countUsers: $countUsers, ')
          ..write('countScenes: $countScenes')
          ..write(')'))
        .toString();
  }
}

class $UseTableScenesTable extends UseTableScenes
    with TableInfo<$UseTableScenesTable, TableScenes> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UseTableScenesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idSceneMeta =
      const VerificationMeta('idScene');
  @override
  late final GeneratedColumn<int> idScene = GeneratedColumn<int>(
      'id_scene', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _idSeriesMeta =
      const VerificationMeta('idSeries');
  @override
  late final GeneratedColumn<int> idSeries = GeneratedColumn<int>(
      'id_series', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _idImageMeta =
      const VerificationMeta('idImage');
  @override
  late final GeneratedColumn<int> idImage = GeneratedColumn<int>(
      'id_image', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeViewMeta =
      const VerificationMeta('typeView');
  @override
  late final GeneratedColumn<int> typeView = GeneratedColumn<int>(
      'type_view', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _idAppMeta = const VerificationMeta('idApp');
  @override
  late final GeneratedColumn<int> idApp = GeneratedColumn<int>(
      'id_app', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _xpMeta = const VerificationMeta('xp');
  @override
  late final GeneratedColumn<int> xp = GeneratedColumn<int>(
      'xp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _completedMeta =
      const VerificationMeta('completed');
  @override
  late final GeneratedColumn<int> completed = GeneratedColumn<int>(
      'completed', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _gridMeta = const VerificationMeta('grid');
  @override
  late final GeneratedColumn<String> grid = GeneratedColumn<String>(
      'grid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _countUsersMeta =
      const VerificationMeta('countUsers');
  @override
  late final GeneratedColumn<int> countUsers = GeneratedColumn<int>(
      'count_users', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _recordTimeMeta =
      const VerificationMeta('recordTime');
  @override
  late final GeneratedColumn<int> recordTime = GeneratedColumn<int>(
      'record_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idScene,
        idSeries,
        idImage,
        typeView,
        idApp,
        xp,
        completed,
        grid,
        countUsers,
        recordTime
      ];
  @override
  String get aliasedName => _alias ?? 'use_table_scenes';
  @override
  String get actualTableName => 'use_table_scenes';
  @override
  VerificationContext validateIntegrity(Insertable<TableScenes> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_scene')) {
      context.handle(_idSceneMeta,
          idScene.isAcceptableOrUnknown(data['id_scene']!, _idSceneMeta));
    } else if (isInserting) {
      context.missing(_idSceneMeta);
    }
    if (data.containsKey('id_series')) {
      context.handle(_idSeriesMeta,
          idSeries.isAcceptableOrUnknown(data['id_series']!, _idSeriesMeta));
    } else if (isInserting) {
      context.missing(_idSeriesMeta);
    }
    if (data.containsKey('id_image')) {
      context.handle(_idImageMeta,
          idImage.isAcceptableOrUnknown(data['id_image']!, _idImageMeta));
    } else if (isInserting) {
      context.missing(_idImageMeta);
    }
    if (data.containsKey('type_view')) {
      context.handle(_typeViewMeta,
          typeView.isAcceptableOrUnknown(data['type_view']!, _typeViewMeta));
    } else if (isInserting) {
      context.missing(_typeViewMeta);
    }
    if (data.containsKey('id_app')) {
      context.handle(
          _idAppMeta, idApp.isAcceptableOrUnknown(data['id_app']!, _idAppMeta));
    } else if (isInserting) {
      context.missing(_idAppMeta);
    }
    if (data.containsKey('xp')) {
      context.handle(_xpMeta, xp.isAcceptableOrUnknown(data['xp']!, _xpMeta));
    } else if (isInserting) {
      context.missing(_xpMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    if (data.containsKey('grid')) {
      context.handle(
          _gridMeta, grid.isAcceptableOrUnknown(data['grid']!, _gridMeta));
    } else if (isInserting) {
      context.missing(_gridMeta);
    }
    if (data.containsKey('count_users')) {
      context.handle(
          _countUsersMeta,
          countUsers.isAcceptableOrUnknown(
              data['count_users']!, _countUsersMeta));
    } else if (isInserting) {
      context.missing(_countUsersMeta);
    }
    if (data.containsKey('record_time')) {
      context.handle(
          _recordTimeMeta,
          recordTime.isAcceptableOrUnknown(
              data['record_time']!, _recordTimeMeta));
    } else if (isInserting) {
      context.missing(_recordTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TableScenes map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TableScenes(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idScene: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_scene'])!,
      idSeries: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_series'])!,
      idImage: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_image'])!,
      typeView: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_view'])!,
      idApp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_app'])!,
      xp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}xp'])!,
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}completed'])!,
      grid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}grid'])!,
      countUsers: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count_users'])!,
      recordTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}record_time'])!,
    );
  }

  @override
  $UseTableScenesTable createAlias(String alias) {
    return $UseTableScenesTable(attachedDatabase, alias);
  }
}

class TableScenes extends DataClass implements Insertable<TableScenes> {
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
  const TableScenes(
      {required this.id,
      required this.idScene,
      required this.idSeries,
      required this.idImage,
      required this.typeView,
      required this.idApp,
      required this.xp,
      required this.completed,
      required this.grid,
      required this.countUsers,
      required this.recordTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_scene'] = Variable<int>(idScene);
    map['id_series'] = Variable<int>(idSeries);
    map['id_image'] = Variable<int>(idImage);
    map['type_view'] = Variable<int>(typeView);
    map['id_app'] = Variable<int>(idApp);
    map['xp'] = Variable<int>(xp);
    map['completed'] = Variable<int>(completed);
    map['grid'] = Variable<String>(grid);
    map['count_users'] = Variable<int>(countUsers);
    map['record_time'] = Variable<int>(recordTime);
    return map;
  }

  UseTableScenesCompanion toCompanion(bool nullToAbsent) {
    return UseTableScenesCompanion(
      id: Value(id),
      idScene: Value(idScene),
      idSeries: Value(idSeries),
      idImage: Value(idImage),
      typeView: Value(typeView),
      idApp: Value(idApp),
      xp: Value(xp),
      completed: Value(completed),
      grid: Value(grid),
      countUsers: Value(countUsers),
      recordTime: Value(recordTime),
    );
  }

  factory TableScenes.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TableScenes(
      id: serializer.fromJson<int>(json['id']),
      idScene: serializer.fromJson<int>(json['idScene']),
      idSeries: serializer.fromJson<int>(json['idSeries']),
      idImage: serializer.fromJson<int>(json['idImage']),
      typeView: serializer.fromJson<int>(json['typeView']),
      idApp: serializer.fromJson<int>(json['idApp']),
      xp: serializer.fromJson<int>(json['xp']),
      completed: serializer.fromJson<int>(json['completed']),
      grid: serializer.fromJson<String>(json['grid']),
      countUsers: serializer.fromJson<int>(json['countUsers']),
      recordTime: serializer.fromJson<int>(json['recordTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idScene': serializer.toJson<int>(idScene),
      'idSeries': serializer.toJson<int>(idSeries),
      'idImage': serializer.toJson<int>(idImage),
      'typeView': serializer.toJson<int>(typeView),
      'idApp': serializer.toJson<int>(idApp),
      'xp': serializer.toJson<int>(xp),
      'completed': serializer.toJson<int>(completed),
      'grid': serializer.toJson<String>(grid),
      'countUsers': serializer.toJson<int>(countUsers),
      'recordTime': serializer.toJson<int>(recordTime),
    };
  }

  TableScenes copyWith(
          {int? id,
          int? idScene,
          int? idSeries,
          int? idImage,
          int? typeView,
          int? idApp,
          int? xp,
          int? completed,
          String? grid,
          int? countUsers,
          int? recordTime}) =>
      TableScenes(
        id: id ?? this.id,
        idScene: idScene ?? this.idScene,
        idSeries: idSeries ?? this.idSeries,
        idImage: idImage ?? this.idImage,
        typeView: typeView ?? this.typeView,
        idApp: idApp ?? this.idApp,
        xp: xp ?? this.xp,
        completed: completed ?? this.completed,
        grid: grid ?? this.grid,
        countUsers: countUsers ?? this.countUsers,
        recordTime: recordTime ?? this.recordTime,
      );
  @override
  String toString() {
    return (StringBuffer('TableScenes(')
          ..write('id: $id, ')
          ..write('idScene: $idScene, ')
          ..write('idSeries: $idSeries, ')
          ..write('idImage: $idImage, ')
          ..write('typeView: $typeView, ')
          ..write('idApp: $idApp, ')
          ..write('xp: $xp, ')
          ..write('completed: $completed, ')
          ..write('grid: $grid, ')
          ..write('countUsers: $countUsers, ')
          ..write('recordTime: $recordTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idScene, idSeries, idImage, typeView,
      idApp, xp, completed, grid, countUsers, recordTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableScenes &&
          other.id == this.id &&
          other.idScene == this.idScene &&
          other.idSeries == this.idSeries &&
          other.idImage == this.idImage &&
          other.typeView == this.typeView &&
          other.idApp == this.idApp &&
          other.xp == this.xp &&
          other.completed == this.completed &&
          other.grid == this.grid &&
          other.countUsers == this.countUsers &&
          other.recordTime == this.recordTime);
}

class UseTableScenesCompanion extends UpdateCompanion<TableScenes> {
  final Value<int> id;
  final Value<int> idScene;
  final Value<int> idSeries;
  final Value<int> idImage;
  final Value<int> typeView;
  final Value<int> idApp;
  final Value<int> xp;
  final Value<int> completed;
  final Value<String> grid;
  final Value<int> countUsers;
  final Value<int> recordTime;
  const UseTableScenesCompanion({
    this.id = const Value.absent(),
    this.idScene = const Value.absent(),
    this.idSeries = const Value.absent(),
    this.idImage = const Value.absent(),
    this.typeView = const Value.absent(),
    this.idApp = const Value.absent(),
    this.xp = const Value.absent(),
    this.completed = const Value.absent(),
    this.grid = const Value.absent(),
    this.countUsers = const Value.absent(),
    this.recordTime = const Value.absent(),
  });
  UseTableScenesCompanion.insert({
    this.id = const Value.absent(),
    required int idScene,
    required int idSeries,
    required int idImage,
    required int typeView,
    required int idApp,
    required int xp,
    this.completed = const Value.absent(),
    required String grid,
    required int countUsers,
    required int recordTime,
  })  : idScene = Value(idScene),
        idSeries = Value(idSeries),
        idImage = Value(idImage),
        typeView = Value(typeView),
        idApp = Value(idApp),
        xp = Value(xp),
        grid = Value(grid),
        countUsers = Value(countUsers),
        recordTime = Value(recordTime);
  static Insertable<TableScenes> custom({
    Expression<int>? id,
    Expression<int>? idScene,
    Expression<int>? idSeries,
    Expression<int>? idImage,
    Expression<int>? typeView,
    Expression<int>? idApp,
    Expression<int>? xp,
    Expression<int>? completed,
    Expression<String>? grid,
    Expression<int>? countUsers,
    Expression<int>? recordTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idScene != null) 'id_scene': idScene,
      if (idSeries != null) 'id_series': idSeries,
      if (idImage != null) 'id_image': idImage,
      if (typeView != null) 'type_view': typeView,
      if (idApp != null) 'id_app': idApp,
      if (xp != null) 'xp': xp,
      if (completed != null) 'completed': completed,
      if (grid != null) 'grid': grid,
      if (countUsers != null) 'count_users': countUsers,
      if (recordTime != null) 'record_time': recordTime,
    });
  }

  UseTableScenesCompanion copyWith(
      {Value<int>? id,
      Value<int>? idScene,
      Value<int>? idSeries,
      Value<int>? idImage,
      Value<int>? typeView,
      Value<int>? idApp,
      Value<int>? xp,
      Value<int>? completed,
      Value<String>? grid,
      Value<int>? countUsers,
      Value<int>? recordTime}) {
    return UseTableScenesCompanion(
      id: id ?? this.id,
      idScene: idScene ?? this.idScene,
      idSeries: idSeries ?? this.idSeries,
      idImage: idImage ?? this.idImage,
      typeView: typeView ?? this.typeView,
      idApp: idApp ?? this.idApp,
      xp: xp ?? this.xp,
      completed: completed ?? this.completed,
      grid: grid ?? this.grid,
      countUsers: countUsers ?? this.countUsers,
      recordTime: recordTime ?? this.recordTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idScene.present) {
      map['id_scene'] = Variable<int>(idScene.value);
    }
    if (idSeries.present) {
      map['id_series'] = Variable<int>(idSeries.value);
    }
    if (idImage.present) {
      map['id_image'] = Variable<int>(idImage.value);
    }
    if (typeView.present) {
      map['type_view'] = Variable<int>(typeView.value);
    }
    if (idApp.present) {
      map['id_app'] = Variable<int>(idApp.value);
    }
    if (xp.present) {
      map['xp'] = Variable<int>(xp.value);
    }
    if (completed.present) {
      map['completed'] = Variable<int>(completed.value);
    }
    if (grid.present) {
      map['grid'] = Variable<String>(grid.value);
    }
    if (countUsers.present) {
      map['count_users'] = Variable<int>(countUsers.value);
    }
    if (recordTime.present) {
      map['record_time'] = Variable<int>(recordTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UseTableScenesCompanion(')
          ..write('id: $id, ')
          ..write('idScene: $idScene, ')
          ..write('idSeries: $idSeries, ')
          ..write('idImage: $idImage, ')
          ..write('typeView: $typeView, ')
          ..write('idApp: $idApp, ')
          ..write('xp: $xp, ')
          ..write('completed: $completed, ')
          ..write('grid: $grid, ')
          ..write('countUsers: $countUsers, ')
          ..write('recordTime: $recordTime')
          ..write(')'))
        .toString();
  }
}

abstract class _$ConnectDataBase extends GeneratedDatabase {
  _$ConnectDataBase(QueryExecutor e) : super(e);
  late final $UseTableAppUserTable useTableAppUser =
      $UseTableAppUserTable(this);
  late final $UseTableAppSettingsTable useTableAppSettings =
      $UseTableAppSettingsTable(this);
  late final $UseTableSeriesTable useTableSeries = $UseTableSeriesTable(this);
  late final $UseTableScenesTable useTableScenes = $UseTableScenesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [useTableAppUser, useTableAppSettings, useTableSeries, useTableScenes];
}
