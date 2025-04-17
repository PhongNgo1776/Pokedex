import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/i_my_pokedex_repository.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/domain/update_my_pokedex_use_case.dart';

class MockMyPokedexRepository extends Mock implements IMyPokedexRepository {}

void main() {
  late UpdateMyPokedexUseCase useCase;
  late MockMyPokedexRepository mockRepository;

  setUp(() {
    mockRepository = MockMyPokedexRepository();
    useCase = UpdateMyPokedexUseCase(myPokedexRepository: mockRepository);
  });

  group('UpdateMyPokedexUseCase', () {
    test('should call repository with provided pokemon list', () {
      // Arrange
      final pokedex = [
        PokemonEntity(
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
        ),
      ];

      when(() => mockRepository.updatePokedex(any())).thenReturn(null);

      // Act
      useCase.execute(pokedex);

      // Assert
      verify(() => mockRepository.updatePokedex(pokedex)).called(1);
    });

    test('should handle empty pokemon list', () {
      // Arrange
      final emptyPokedex = <PokemonEntity>[];
      when(() => mockRepository.updatePokedex(any())).thenReturn(null);

      // Act
      useCase.execute(emptyPokedex);

      // Assert
      verify(() => mockRepository.updatePokedex(emptyPokedex)).called(1);
    });
  });
}
