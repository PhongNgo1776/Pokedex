// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PokemonModel extends _PokemonModel
    with RealmEntity, RealmObjectBase, RealmObject {
  PokemonModel(
    int id,
    String name,
    String imageUrl, {
    PokemonGenerationModel? generation,
    Iterable<PokemonEffectEntryModel> effectEntries = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'imageUrl', imageUrl);
    RealmObjectBase.set(this, 'generation', generation);
    RealmObjectBase.set<RealmList<PokemonEffectEntryModel>>(this,
        'effectEntries', RealmList<PokemonEffectEntryModel>(effectEntries));
  }

  PokemonModel._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get imageUrl =>
      RealmObjectBase.get<String>(this, 'imageUrl') as String;
  @override
  set imageUrl(String value) => RealmObjectBase.set(this, 'imageUrl', value);

  @override
  PokemonGenerationModel? get generation =>
      RealmObjectBase.get<PokemonGenerationModel>(this, 'generation')
          as PokemonGenerationModel?;
  @override
  set generation(covariant PokemonGenerationModel? value) =>
      RealmObjectBase.set(this, 'generation', value);

  @override
  RealmList<PokemonEffectEntryModel> get effectEntries =>
      RealmObjectBase.get<PokemonEffectEntryModel>(this, 'effectEntries')
          as RealmList<PokemonEffectEntryModel>;
  @override
  set effectEntries(covariant RealmList<PokemonEffectEntryModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<PokemonModel>> get changes =>
      RealmObjectBase.getChanges<PokemonModel>(this);

  @override
  Stream<RealmObjectChanges<PokemonModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<PokemonModel>(this, keyPaths);

  @override
  PokemonModel freeze() => RealmObjectBase.freezeObject<PokemonModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'imageUrl': imageUrl.toEJson(),
      'generation': generation.toEJson(),
      'effectEntries': effectEntries.toEJson(),
    };
  }

  static EJsonValue _toEJson(PokemonModel value) => value.toEJson();
  static PokemonModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'imageUrl': EJsonValue imageUrl,
      } =>
        PokemonModel(
          fromEJson(id),
          fromEJson(name),
          fromEJson(imageUrl),
          generation: fromEJson(ejson['generation']),
          effectEntries: fromEJson(ejson['effectEntries']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(PokemonModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, PokemonModel, 'PokemonModel', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('imageUrl', RealmPropertyType.string),
      SchemaProperty('generation', RealmPropertyType.object,
          optional: true, linkTarget: 'PokemonGenerationModel'),
      SchemaProperty('effectEntries', RealmPropertyType.object,
          linkTarget: 'PokemonEffectEntryModel',
          collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class PokemonGenerationModel extends _PokemonGenerationModel
    with RealmEntity, RealmObjectBase, RealmObject {
  PokemonGenerationModel(
    String name,
    String url,
  ) {
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'url', url);
  }

  PokemonGenerationModel._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get url => RealmObjectBase.get<String>(this, 'url') as String;
  @override
  set url(String value) => RealmObjectBase.set(this, 'url', value);

  @override
  Stream<RealmObjectChanges<PokemonGenerationModel>> get changes =>
      RealmObjectBase.getChanges<PokemonGenerationModel>(this);

  @override
  Stream<RealmObjectChanges<PokemonGenerationModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<PokemonGenerationModel>(this, keyPaths);

  @override
  PokemonGenerationModel freeze() =>
      RealmObjectBase.freezeObject<PokemonGenerationModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'name': name.toEJson(),
      'url': url.toEJson(),
    };
  }

  static EJsonValue _toEJson(PokemonGenerationModel value) => value.toEJson();
  static PokemonGenerationModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'name': EJsonValue name,
        'url': EJsonValue url,
      } =>
        PokemonGenerationModel(
          fromEJson(name),
          fromEJson(url),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(PokemonGenerationModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, PokemonGenerationModel,
        'PokemonGenerationModel', [
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('url', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class PokemonEffectEntryModel extends _PokemonEffectEntryModel
    with RealmEntity, RealmObjectBase, RealmObject {
  PokemonEffectEntryModel(
    String effect,
    String shortEffect, {
    PokemonEffectEntryLanguageModel? language,
  }) {
    RealmObjectBase.set(this, 'effect', effect);
    RealmObjectBase.set(this, 'language', language);
    RealmObjectBase.set(this, 'shortEffect', shortEffect);
  }

  PokemonEffectEntryModel._();

  @override
  String get effect => RealmObjectBase.get<String>(this, 'effect') as String;
  @override
  set effect(String value) => RealmObjectBase.set(this, 'effect', value);

  @override
  PokemonEffectEntryLanguageModel? get language =>
      RealmObjectBase.get<PokemonEffectEntryLanguageModel>(this, 'language')
          as PokemonEffectEntryLanguageModel?;
  @override
  set language(covariant PokemonEffectEntryLanguageModel? value) =>
      RealmObjectBase.set(this, 'language', value);

  @override
  String get shortEffect =>
      RealmObjectBase.get<String>(this, 'shortEffect') as String;
  @override
  set shortEffect(String value) =>
      RealmObjectBase.set(this, 'shortEffect', value);

  @override
  Stream<RealmObjectChanges<PokemonEffectEntryModel>> get changes =>
      RealmObjectBase.getChanges<PokemonEffectEntryModel>(this);

  @override
  Stream<RealmObjectChanges<PokemonEffectEntryModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<PokemonEffectEntryModel>(this, keyPaths);

  @override
  PokemonEffectEntryModel freeze() =>
      RealmObjectBase.freezeObject<PokemonEffectEntryModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'effect': effect.toEJson(),
      'language': language.toEJson(),
      'shortEffect': shortEffect.toEJson(),
    };
  }

  static EJsonValue _toEJson(PokemonEffectEntryModel value) => value.toEJson();
  static PokemonEffectEntryModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'effect': EJsonValue effect,
        'shortEffect': EJsonValue shortEffect,
      } =>
        PokemonEffectEntryModel(
          fromEJson(effect),
          fromEJson(shortEffect),
          language: fromEJson(ejson['language']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(PokemonEffectEntryModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, PokemonEffectEntryModel,
        'PokemonEffectEntryModel', [
      SchemaProperty('effect', RealmPropertyType.string),
      SchemaProperty('language', RealmPropertyType.object,
          optional: true, linkTarget: 'PokemonEffectEntryLanguageModel'),
      SchemaProperty('shortEffect', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class PokemonEffectEntryLanguageModel extends _PokemonEffectEntryLanguageModel
    with RealmEntity, RealmObjectBase, RealmObject {
  PokemonEffectEntryLanguageModel(
    String name,
    String url,
  ) {
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'url', url);
  }

  PokemonEffectEntryLanguageModel._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get url => RealmObjectBase.get<String>(this, 'url') as String;
  @override
  set url(String value) => RealmObjectBase.set(this, 'url', value);

  @override
  Stream<RealmObjectChanges<PokemonEffectEntryLanguageModel>> get changes =>
      RealmObjectBase.getChanges<PokemonEffectEntryLanguageModel>(this);

  @override
  Stream<RealmObjectChanges<PokemonEffectEntryLanguageModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<PokemonEffectEntryLanguageModel>(
          this, keyPaths);

  @override
  PokemonEffectEntryLanguageModel freeze() =>
      RealmObjectBase.freezeObject<PokemonEffectEntryLanguageModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'name': name.toEJson(),
      'url': url.toEJson(),
    };
  }

  static EJsonValue _toEJson(PokemonEffectEntryLanguageModel value) =>
      value.toEJson();
  static PokemonEffectEntryLanguageModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'name': EJsonValue name,
        'url': EJsonValue url,
      } =>
        PokemonEffectEntryLanguageModel(
          fromEJson(name),
          fromEJson(url),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(PokemonEffectEntryLanguageModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject,
        PokemonEffectEntryLanguageModel, 'PokemonEffectEntryLanguageModel', [
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('url', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
