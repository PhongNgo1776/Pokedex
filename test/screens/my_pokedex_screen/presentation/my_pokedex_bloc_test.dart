import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/delete_pokemon_use_case.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/domain/get_my_pokedex_use_case.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/domain/update_my_pokedex_use_case.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_bloc.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_event.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/cached_random_pokemons.dart';

class MockGetMyPokedexUseCase extends Mock implements GetMyPokedexUseCase {}

class MockUpdateMyPokedexUseCase extends Mock
    implements UpdateMyPokedexUseCase {}

class MockDeletePokemonUseCase extends Mock implements DeletePokemonUseCase {}

void main() {
  late MyPokedexBloc bloc;
  late MockGetMyPokedexUseCase getMyPokedexUseCase;
  late MockUpdateMyPokedexUseCase updateMyPokedexUseCase;
  late MockDeletePokemonUseCase deletePokemonUseCase;
  final getIt = GetIt.instance;

  setUpAll(() {
    // Register DeletePokemonUseCase mock
    deletePokemonUseCase = MockDeletePokemonUseCase();
    getIt.registerSingleton<DeletePokemonUseCase>(deletePokemonUseCase);
  });

  tearDownAll(() {
    // Reset GetIt
    getIt.reset();
  });

  final testPokemon1 = PokemonEntity(
    id: 1,
    name: 'Bulbasaur',
    imageUrl: 'https://example.com/bulbasaur.png',
    isFavorite: true,
    generation: PokemonGenerationEntity(
      name: 'Gen I',
      url: 'https://example.com/gen1',
    ),
    effectEntries: [],
  );

  final testPokemon2 = PokemonEntity(
    id: 2,
    name: 'Ivysaur',
    imageUrl: 'https://example.com/ivysaur.png',
    isFavorite: true,
    generation: PokemonGenerationEntity(
      name: 'Gen I',
      url: 'https://example.com/gen1',
    ),
    effectEntries: [],
  );

  setUp(() {
    getMyPokedexUseCase = MockGetMyPokedexUseCase();
    updateMyPokedexUseCase = MockUpdateMyPokedexUseCase();

    when(() => getMyPokedexUseCase.execute())
        .thenReturn([testPokemon1, testPokemon2]);

    bloc = MyPokedexBloc(
      getMyPokedexUseCase: getMyPokedexUseCase,
      updateMyPokedexUseCase: updateMyPokedexUseCase,
    );

    CachedRandomPokemons.latestRandomPokemons = [testPokemon1, testPokemon2];
  });

  tearDown(() {
    bloc.close();
  });

  group('MyPokedexBloc', () {
    test('initial state should contain pokedex from use case', () {
      expect(bloc.state.pokedex, equals([testPokemon1, testPokemon2]));
    });

    group('DeletePokemonEvent', () {
      test('should delete pokemon and update cached random pokemons', () async {
        // Arrange
        when(() => deletePokemonUseCase.execute(any())).thenReturn(null);

        // Act
        bloc.add(DeletePokemonEvent(pokemon: testPokemon1));
        await Future.delayed(const Duration(milliseconds: 100));

        // Assert
        verify(() => deletePokemonUseCase.execute(testPokemon1.id)).called(1);
        expect(bloc.state.pokedex.length, equals(1));
        expect(bloc.state.pokedex.contains(testPokemon1), isFalse);
        expect(
          CachedRandomPokemons.latestRandomPokemons
              .firstWhere((pokemon) => pokemon.id == testPokemon1.id)
              .isFavorite,
          isFalse,
        );
      });
    });

    group('ReOrderPokedexEvent', () {
      test('should reorder pokemons and update storage', () async {
        // Arrange
        when(() => updateMyPokedexUseCase.execute(any())).thenReturn(null);

        // Act
        bloc.add(const ReOrderPokedexEvent(oldIndex: 0, newIndex: 1));
        await Future.delayed(const Duration(milliseconds: 100));

        // Assert
        verify(() => updateMyPokedexUseCase.execute(any())).called(1);
        expect(bloc.state.pokedex.first, equals(testPokemon2));
        expect(bloc.state.pokedex.last, equals(testPokemon1));
      });
    });
  });
}
