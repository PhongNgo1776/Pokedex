import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/delete_pokemon_use_case.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/i_my_pokedex_repository.dart';

class MockMyPokedexRepository extends Mock implements IMyPokedexRepository {}

void main() {
  late DeletePokemonUseCase useCase;
  late MockMyPokedexRepository mockRepository;

  setUp(() {
    mockRepository = MockMyPokedexRepository();
    useCase = DeletePokemonUseCase(pokemonsRepository: mockRepository);
  });

  group('DeletePokemonUseCase', () {
    test('should call repository with provided pokemon id', () {
      // Arrange
      const pokemonId = 1;
      when(() => mockRepository.deletePokemon(any())).thenReturn(null);

      // Act
      useCase.execute(pokemonId);

      // Assert
      verify(() => mockRepository.deletePokemon(pokemonId)).called(1);
    });

    test('should handle zero or negative pokemon id', () {
      // Arrange
      const pokemonId = 0;
      when(() => mockRepository.deletePokemon(any())).thenReturn(null);

      // Act
      useCase.execute(pokemonId);

      // Assert
      verify(() => mockRepository.deletePokemon(pokemonId)).called(1);
    });
  });
}
