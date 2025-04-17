import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/i_my_pokedex_repository.dart';

class MockMyPokedexRepository extends Mock implements IMyPokedexRepository {}

void main() {
  late MockMyPokedexRepository repository;

  setUp(() {
    repository = MockMyPokedexRepository();
  });

  group('IMyPokedexRepository', () {
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

    test('savePokemon should not throw', () {
      // Act & Assert
      expect(() => repository.savePokemon(testPokemon), returnsNormally);
      verify(() => repository.savePokemon(testPokemon)).called(1);
    });

    test('deletePokemon should not throw', () {
      // Arrange
      when(() => repository.deletePokemon(any())).thenReturn(null);

      // Act & Assert
      expect(() => repository.deletePokemon(1), returnsNormally);
      verify(() => repository.deletePokemon(1)).called(1);
    });

    test('getMyPokedex should return list of pokemons', () {
      // Arrange
      final expectedPokemons = [testPokemon];
      when(() => repository.getMyPokedex()).thenReturn(expectedPokemons);

      // Act
      final result = repository.getMyPokedex();

      // Assert
      expect(result, equals(expectedPokemons));
      verify(() => repository.getMyPokedex()).called(1);
    });

    test('updatePokedex should not throw', () {
      // Arrange
      final pokedex = [testPokemon];
      when(() => repository.updatePokedex(any())).thenReturn(null);

      // Act & Assert
      expect(() => repository.updatePokedex(pokedex), returnsNormally);
      verify(() => repository.updatePokedex(pokedex)).called(1);
    });
  });
}
