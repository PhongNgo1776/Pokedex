import 'package:equatable/equatable.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/models/pokemon_model.dart';

class PokemonEntity implements Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final PokemonGenerationEntity? generation;
  final List<PokemonEffectEntryEntity> effectEntries;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.generation,
    required this.effectEntries,
  });

  factory PokemonEntity.fromModel(PokemonModel model) {
    return PokemonEntity(
      id: model.id,
      name: model.name,
      imageUrl: model.imageUrl,
      generation: model.generation != null
          ? PokemonGenerationEntity.fromModel(model.generation!)
          : null,
      effectEntries: model.effectEntries
          .map((e) => PokemonEffectEntryEntity.fromModel(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        generation,
        effectEntries,
      ];

  @override
  bool? get stringify => true;
}

class PokemonGenerationEntity implements Equatable {
  final String name;
  final String url;

  const PokemonGenerationEntity({
    required this.name,
    required this.url,
  });

  factory PokemonGenerationEntity.fromModel(PokemonGenerationModel model) {
    return PokemonGenerationEntity(
      name: model.name,
      url: model.url,
    );
  }

  @override
  List<Object?> get props => [name, url];

  @override
  bool? get stringify => true;
}

class PokemonEffectEntryEntity implements Equatable {
  final String effect;
  final PokemonEffectEntryLanguageEntity? language;
  final String shortEffect;
  const PokemonEffectEntryEntity({
    required this.effect,
    this.language,
    required this.shortEffect,
  });

  @override
  List<Object?> get props => [effect, language];

  @override
  bool? get stringify => true;

  factory PokemonEffectEntryEntity.fromModel(PokemonEffectEntryModel model) {
    return PokemonEffectEntryEntity(
        effect: model.effect,
        language: model.language != null
            ? PokemonEffectEntryLanguageEntity.fromModel(model.language!)
            : null,
        shortEffect: model.shortEffect);
  }
}

class PokemonEffectEntryLanguageEntity implements Equatable {
  final String name;
  final String url;

  const PokemonEffectEntryLanguageEntity({
    required this.name,
    required this.url,
  });

  factory PokemonEffectEntryLanguageEntity.fromModel(
      PokemonEffectEntryLanguageModel model) {
    return PokemonEffectEntryLanguageEntity(
      name: model.name,
      url: model.url,
    );
  }

  @override
  List<Object?> get props => [name, url];

  @override
  bool? get stringify => true;
}
