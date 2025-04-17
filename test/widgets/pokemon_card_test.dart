import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/widgets/pokemon_card.dart';

void main() {
  final mockPokemon = PokemonEntity(
    id: 1,
    name: 'Bulbasaur',
    imageUrl: 'https://example.com/bulbasaur.png',
    generation: PokemonGenerationEntity(
      name: 'Gen I',
      url: 'https://example.com/gen1',
    ),
    effectEntries: [
      PokemonEffectEntryEntity(
        effect: 'Test effect entry',
        shortEffect: 'Test short effect entry',
        language: PokemonEffectEntryLanguageEntity(
          name: 'en',
          url: 'https://example.com/en',
        ),
      ),
    ],
  );

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: Scaffold(
        body: PokemonCard(
          pokemon: mockPokemon,
          actionButton: ElevatedButton(
            onPressed: () {},
            child: const Text('Test Button'),
          ),
        ),
      ),
    );
  }

  group('PokemonCard', () {
    testWidgets('renders all components correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Verify Pokemon image is rendered
      expect(find.byType(CachedNetworkImage), findsOneWidget);
      final CachedNetworkImage image =
          tester.widget(find.byType(CachedNetworkImage));
      expect(image.imageUrl, equals(mockPokemon.imageUrl));
      expect(image.cacheKey, equals(mockPokemon.imageUrl));

      // Verify Pokemon name is displayed
      expect(find.text('Bulbasaur'), findsOneWidget);

      // Verify Generation name is displayed
      expect(find.text('Gen I'), findsOneWidget);

      // Verify effect entry is displayed
      expect(find.text('Test short effect entry'), findsOneWidget);

      // Verify action button is rendered
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('handles long Pokemon names correctly',
        (WidgetTester tester) async {
      final longNamePokemon = mockPokemon.copyWith(
        name: 'Very Long Pokemon Name That Should Ellipsis',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PokemonCard(
              pokemon: longNamePokemon,
              actionButton: ElevatedButton(
                onPressed: () {},
                child: const Text('Test Button'),
              ),
            ),
          ),
        ),
      );

      final Text nameText = tester.widget(
        find.text('Very Long Pokemon Name That Should Ellipsis'),
      );
      expect(nameText.overflow, equals(TextOverflow.ellipsis));
    });

    testWidgets('handles missing generation gracefully',
        (WidgetTester tester) async {
      final noGenPokemon = PokemonEntity(
        id: 1,
        name: 'Bulbasaur',
        imageUrl: 'https://example.com/bulbasaur.png',
        generation: null,
        effectEntries: [
          PokemonEffectEntryEntity(
            effect: 'Test effect entry',
            shortEffect: 'Test short effect entry',
            language: PokemonEffectEntryLanguageEntity(
              name: 'en',
              url: 'https://example.com/en',
            ),
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PokemonCard(
              pokemon: noGenPokemon,
              actionButton: ElevatedButton(
                onPressed: () {},
                child: const Text('Test Button'),
              ),
            ),
          ),
        ),
      );
      expect(find.text(''), findsOneWidget); // Generation text should be empty
    });
  });
}
