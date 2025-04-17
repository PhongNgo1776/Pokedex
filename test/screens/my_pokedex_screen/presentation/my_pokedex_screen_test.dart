import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/pokemon_event.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_bloc.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_event.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_screen.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_state.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/cached_random_pokemons.dart';
import 'package:phongngo.pokedex/widgets/pokemon_card.dart';

class MockMyPokedexBloc extends MockBloc<PokemonEvent, MyPokedexState>
    implements MyPokedexBloc {}

void main() {
  late MockMyPokedexBloc mockBloc;

  final testPokemon1 = PokemonEntity(
    id: 1,
    name: 'Bulbasaur',
    imageUrl: 'url1',
    isFavorite: true,
    generation: PokemonGenerationEntity(name: 'Gen I', url: 'url'),
    effectEntries: [],
  );

  final testPokemon2 = PokemonEntity(
    id: 2,
    name: 'Ivysaur',
    imageUrl: 'url2',
    isFavorite: true,
    generation: PokemonGenerationEntity(name: 'Gen I', url: 'url'),
    effectEntries: [],
  );

  setUp(() {
    mockBloc = MockMyPokedexBloc();
    // Initialize CachedRandomPokemons for each test
    CachedRandomPokemons.latestRandomPokemons = [testPokemon1, testPokemon2];
  });

  tearDown(() {
    // Clear CachedRandomPokemons after each test
    CachedRandomPokemons.latestRandomPokemons = [];
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<MyPokedexBloc>(
        create: (context) => mockBloc,
        child: const MyPokedexScreen(),
      ),
    );
  }

  setUpAll(() {
    registerFallbackValue(DeletePokemonEvent(
        pokemon: PokemonEntity(
      id: 0,
      name: 'Test',
      imageUrl: 'test',
      generation: PokemonGenerationEntity(name: 'Test', url: 'test'),
      effectEntries: [],
    )));
    registerFallbackValue(const ReOrderPokedexEvent(oldIndex: 0, newIndex: 0));
  });

  group('MyPokedexScreen', () {
    testWidgets('shows empty state when no pokemons', (tester) async {
      // Arrange
      when(() => mockBloc.state).thenReturn(MyPokedexState(pokedex: []));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Assert
      expect(find.text('No pokemons found'), findsOneWidget);
      expect(find.byType(ReorderableListView), findsNothing);
    });

    testWidgets('shows pokemon list when has 1 pokemon', (tester) async {
      // Arrange
      when(() => mockBloc.state)
          .thenReturn(MyPokedexState(pokedex: [testPokemon1]));
      CachedRandomPokemons.latestRandomPokemons = [testPokemon1];

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(PokemonCard), findsOneWidget);
      expect(find.text('Bulbasaur'), findsOneWidget);
    });

    testWidgets('shows pokemon list when has pokemons', (tester) async {
      // Arrange
      when(() => mockBloc.state)
          .thenReturn(MyPokedexState(pokedex: [testPokemon1, testPokemon2]));
      CachedRandomPokemons.latestRandomPokemons = [testPokemon1, testPokemon2];

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(PokemonCard), findsNWidgets(2));
      expect(find.text('Bulbasaur'), findsOneWidget);
      expect(find.text('Ivysaur'), findsOneWidget);
    });

    testWidgets('deletes pokemon when close button is tapped', (tester) async {
      // Arrange
      when(() => mockBloc.state)
          .thenReturn(MyPokedexState(pokedex: [testPokemon1]));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();
      expect(find.byType(PokemonCard), findsOneWidget);

      // Find and tap the IconButton instead of just the Icon
      await tester.tap(find.byType(IconButton).first);
      await tester.pumpAndSettle();

      // Assert
      verify(() => mockBloc.add(any(that: isA<DeletePokemonEvent>())))
          .called(1);
    });
  });
}
