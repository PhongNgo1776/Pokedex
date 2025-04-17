import 'package:equatable/equatable.dart';
import 'package:phongngo.pokedex/core/pokemons/data/models/pokemon_model.dart';

class PokemonEntity implements Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final PokemonGenerationEntity? generation;
  final List<PokemonEffectEntryEntity> effectEntries;
  final bool isFavorite;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.generation,
    required this.effectEntries,
    this.isFavorite = false,
  });

  factory PokemonEntity.fromModel(PokemonModel model,
      {bool isFavorite = false}) {
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
      isFavorite: isFavorite,
    );
  }

  PokemonEntity copyWith({
    int? id,
    String? name,
    String? imageUrl,
    PokemonGenerationEntity? generation,
    List<PokemonEffectEntryEntity>? effectEntries,
    bool? isFavorite,
  }) {
    return PokemonEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      generation: generation ?? this.generation,
      effectEntries: effectEntries ?? this.effectEntries,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  static PokemonModel toModel(PokemonEntity entity) {
    return PokemonModel(
      entity.id,
      entity.name,
      entity.imageUrl,
      generation: entity.generation != null
          ? PokemonGenerationEntity.toModel(entity.generation!)
          : null,
      effectEntries: entity.effectEntries
          .map((e) => PokemonEffectEntryEntity.toModel(e))
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

  static PokemonGenerationModel toModel(PokemonGenerationEntity entity) {
    return PokemonGenerationModel(
      entity.name,
      entity.url,
    );
  }
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

  static PokemonEffectEntryModel toModel(PokemonEffectEntryEntity entity) {
    return PokemonEffectEntryModel(
      entity.effect,
      entity.shortEffect,
      language: entity.language != null
          ? PokemonEffectEntryLanguageEntity.toModel(entity.language!)
          : null,
    );
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

  static PokemonEffectEntryLanguageModel toModel(
      PokemonEffectEntryLanguageEntity entity) {
    return PokemonEffectEntryLanguageModel(
      entity.name,
      entity.url,
    );
  }
}
