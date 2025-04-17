import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/i_my_pokedex_repository.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/domain/get_my_pokedex_use_case.dart';

class MockMyPokedexRepository extends Mock implements IMyPokedexRepository {}

void main() {
  late GetMyPokedexUseCase useCase;
  late MockMyPokedexRepository mockRepository;

  setUp(() {
    mockRepository = MockMyPokedexRepository();
    useCase = GetMyPokedexUseCase(myPokedexRepository: mockRepository);
  });

  group('GetMyPokedexUseCase', () {
    test('should return list of pokemons from repository', () {
      // Arrange
      final expectedPokemons = [
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

      when(() => mockRepository.getMyPokedex()).thenReturn(expectedPokemons);

      // Act
      final result = useCase.execute();

      // Assert
      expect(result, equals(expectedPokemons));
      verify(() => mockRepository.getMyPokedex()).called(1);
    });

    test('should return empty list when repository returns empty', () {
      // Arrange
      when(() => mockRepository.getMyPokedex()).thenReturn([]);

      // Act
      final result = useCase.execute();

      // Assert
      expect(result, isEmpty);
      verify(() => mockRepository.getMyPokedex()).called(1);
    });
  });
}
