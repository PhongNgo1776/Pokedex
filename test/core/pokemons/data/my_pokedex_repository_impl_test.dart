import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:phongngo.pokedex/core/pokemons/data/i_my_pokedex_local_datasource.dart';
import 'package:phongngo.pokedex/core/pokemons/data/models/pokemon_model.dart';
import 'package:phongngo.pokedex/core/pokemons/data/my_pokedex_repository_impl.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';

class MockMyPokedexLocalDatasource extends Mock
    implements IMyPokedexLocalDatasource {}

void main() {
  late MyPokedexRepositoryImpl repository;
  late MockMyPokedexLocalDatasource mockLocalDatasource;

  setUpAll(() {
    // Register fallback values for models
    final fallbackLanguageModel = PokemonEffectEntryLanguageModel('en', 'url');
    final fallbackEffectEntry = PokemonEffectEntryModel(
      'effect',
      'shortEffect',
      language: fallbackLanguageModel,
    );
    final fallbackGeneration = PokemonGenerationModel('Gen I', 'url');
    final fallbackPokemonModel = PokemonModel(
      1,
      'Fallback Pokemon',
      'https://example.com/fallback.png',
      generation: fallbackGeneration,
      effectEntries: [fallbackEffectEntry],
    );

    registerFallbackValue(fallbackPokemonModel);
    registerFallbackValue([fallbackPokemonModel]);
  });

  setUp(() {
    mockLocalDatasource = MockMyPokedexLocalDatasource();
    repository = MyPokedexRepositoryImpl(
      myPokedexLocalDatasource: mockLocalDatasource,
    );
  });

  group('MyPokedexRepositoryImpl', () {
    final testPokemon = PokemonEntity(
      id: 1,
      name: 'Bulbasaur',
      imageUrl: 'https://example.com/bulbasaur.png',
      isFavorite: true,
      generation: PokemonGenerationEntity(
        name: 'Gen I',
        url: 'https://example.com/gen1',
      ),
      effectEntries: [
        PokemonEffectEntryEntity(
          effect: 'Test effect',
          shortEffect: 'Test short effect',
          language: PokemonEffectEntryLanguageEntity(
            name: 'en',
            url: 'https://example.com/en',
          ),
        ),
      ],
    );

    test('savePokemon should call local datasource with correct model', () {
      // Arrange
      when(() => mockLocalDatasource.savePokemon(any())).thenReturn(null);

      // Act
      repository.savePokemon(testPokemon);

      // Assert
      verify(() => mockLocalDatasource.savePokemon(any())).called(1);
    });

    test('deletePokemon should call local datasource with correct id', () {
      // Arrange
      const pokemonId = 1;
      when(() => mockLocalDatasource.deletePokemon(any())).thenReturn(null);

      // Act
      repository.deletePokemon(pokemonId);

      // Assert
      verify(() => mockLocalDatasource.deletePokemon(pokemonId)).called(1);
    });

    test(
        'getMyPokedex should return transformed entities from local datasource',
        () {
      // Arrange
      final pokemonModel = PokemonEntity.toModel(testPokemon);
      when(() => mockLocalDatasource.getPokedex()).thenReturn([pokemonModel]);

      // Act
      final result = repository.getMyPokedex();

      // Assert
      expect(result.length, 1);
      expect(result.first.id, equals(testPokemon.id));
      expect(result.first.name, equals(testPokemon.name));
      expect(result.first.isFavorite, isTrue);
      verify(() => mockLocalDatasource.getPokedex()).called(1);
    });

    test('updatePokedex should call local datasource with transformed models',
        () {
      // Arrange
      final pokedex = [testPokemon];
      when(() => mockLocalDatasource.updatePokedex(any())).thenReturn(null);

      // Act
      repository.updatePokedex(pokedex);

      // Assert
      verify(() => mockLocalDatasource.updatePokedex(any())).called(1);
    });
  });
}
