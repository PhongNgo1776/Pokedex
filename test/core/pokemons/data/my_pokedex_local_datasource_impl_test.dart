import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:phongngo.pokedex/core/pokemons/data/models/pokemon_model.dart';
import 'package:phongngo.pokedex/core/pokemons/data/my_pokedex_local_datasource_impl.dart';
import 'package:phongngo.pokedex/core/realm_db.dart';

class MockRealmDB extends Mock implements RealmDB {}

void main() {
  late MyPokedexLocalDatasourceImpl datasource;
  late MockRealmDB mockRealmDB;

  setUpAll(() {
    // Create fallback models
    final fallbackLanguage = PokemonEffectEntryLanguageModel('en', 'url');
    final fallbackEffectEntry = PokemonEffectEntryModel(
      'effect',
      'short effect',
      language: fallbackLanguage,
    );
    final fallbackGeneration = PokemonGenerationModel('Gen I', 'url');
    final fallbackPokemon = PokemonModel(
      1,
      'Fallback Pokemon',
      'https://example.com/fallback.png',
      generation: fallbackGeneration,
      effectEntries: [fallbackEffectEntry],
    );

    // Register fallback values for Mocktail matchers
    registerFallbackValue(fallbackPokemon);
    registerFallbackValue(<PokemonModel>[fallbackPokemon]);
  });

  setUp(() {
    mockRealmDB = MockRealmDB();
    datasource = MyPokedexLocalDatasourceImpl(realmDB: mockRealmDB);
  });

  group('MyPokedexLocalDatasourceImpl', () {
    final testPokemonModel = PokemonModel(
      1,
      'Bulbasaur',
      'https://example.com/bulbasaur.png',
      generation: PokemonGenerationModel('Gen I', 'https://example.com/gen1'),
      effectEntries: [
        PokemonEffectEntryModel(
          'Test effect',
          'Test short effect',
          language:
              PokemonEffectEntryLanguageModel('en', 'https://example.com/en'),
        ),
      ],
    );

    test(
        'savePokemon should call RealmDB.addOrUpdateModel with correct parameters',
        () {
      // Arrange
      when(() => mockRealmDB.addOrUpdateModel<PokemonModel>(any(), any()))
          .thenReturn(null);

      // Act
      datasource.savePokemon(testPokemonModel);

      // Assert
      verify(() => mockRealmDB.addOrUpdateModel<PokemonModel>(
            testPokemonModel,
            testPokemonModel.id,
          )).called(1);
    });

    test('deletePokemon should call RealmDB.deleteModel with correct id', () {
      // Arrange
      const pokemonId = 1;
      when(() => mockRealmDB.deleteModel<PokemonModel>(any())).thenReturn(null);

      // Act
      datasource.deletePokemon(pokemonId);

      // Assert
      verify(() => mockRealmDB.deleteModel<PokemonModel>(pokemonId)).called(1);
    });

    test('getPokedex should return list of pokemon models from RealmDB', () {
      // Arrange
      final expectedPokemons = [testPokemonModel];
      when(() => mockRealmDB.getAllModels<PokemonModel>())
          .thenReturn(expectedPokemons);

      // Act
      final result = datasource.getPokedex();

      // Assert
      expect(result, equals(expectedPokemons));
      verify(() => mockRealmDB.getAllModels<PokemonModel>()).called(1);
    });

    test('updatePokedex should call RealmDB.updateAll with correct parameters',
        () {
      // Arrange
      final pokedex = [testPokemonModel];
      when(() => mockRealmDB.updateAll<PokemonModel>(any())).thenReturn(null);

      // Act
      datasource.updatePokedex(pokedex);

      // Assert
      verify(() => mockRealmDB.updateAll<PokemonModel>(pokedex)).called(1);
    });
  });
}
