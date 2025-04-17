import 'package:realm/realm.dart';

part 'pokemon_model.realm.dart';

@RealmModel()
class _PokemonModel {
  @PrimaryKey()
  late int id;
  late String name;
  late String imageUrl;
  _PokemonGenerationModel? generation;
  late List<_PokemonEffectEntryModel> effectEntries;
}

@RealmModel()
class _PokemonGenerationModel {
  @PrimaryKey()
  late String name;
  late String url;
}

@RealmModel()
class _PokemonEffectEntryModel {
  @PrimaryKey()
  late String effect;
  _PokemonEffectEntryLanguageModel? language;
  late String shortEffect;
}

@RealmModel()
class _PokemonEffectEntryLanguageModel {
  @PrimaryKey()
  late String name;
  late String url;
}

class PokemonModelUtils {
  static PokemonModel fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      json['id'] as int,
      json['name'] as String,
      'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/133.png',
      generation: json['generation'] != null
          ? _PokemonGenerationModelUtils.fromJson(json['generation'])
          : null,
      effectEntries: (json['effect_entries'] as List<dynamic>)
          .map((e) => _PokemonEffectEntryModelUtils.fromJson(e))
          .toList(),
    );
  }
}

class _PokemonGenerationModelUtils {
  static PokemonGenerationModel fromJson(Map<String, dynamic> json) {
    return PokemonGenerationModel(
      json['name'] as String,
      json['url'] as String,
    );
  }
}

class _PokemonEffectEntryModelUtils {
  static PokemonEffectEntryModel fromJson(Map<String, dynamic> json) {
    return PokemonEffectEntryModel(
      json['effect'] as String,
      json['short_effect'] as String,
      language: _PokemonEffectEntryLanguageModelUtils.fromJson(
        json['language'] as Map<String, dynamic>,
      ),
    );
  }
}

class _PokemonEffectEntryLanguageModelUtils {
  static PokemonEffectEntryLanguageModel fromJson(Map<String, dynamic> json) {
    return PokemonEffectEntryLanguageModel(
      json['name'] as String,
      json['url'] as String,
    );
  }
}
