import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/i_my_pokedex_repository.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/save_pokemon_use_case.dart';

class MockMyPokedexRepository extends Mock implements IMyPokedexRepository {}

void main() {
  late SavePokemonUseCase useCase;
  late MockMyPokedexRepository mockRepository;

  setUp(() {
    mockRepository = MockMyPokedexRepository();
    useCase = SavePokemonUseCase(pokemonsRepository: mockRepository);
  });

  group('SavePokemonUseCase', () {
    test('should call repository with provided pokemon', () {
      // Arrange
      final pokemon = PokemonEntity(
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

      // Act
      useCase.execute(pokemon);

      // Assert
      verify(() => mockRepository.savePokemon(pokemon)).called(1);
    });
  });
}
