import 'package:flutter_test/flutter_test.dart';
import 'package:phongngo.pokedex/core/pokemons/data/models/pokemon_model.dart';

void main() {
  group('Pokemon Models', () {
    group('PokemonModelUtils', () {
      test('fromJson should correctly parse Pokemon JSON', () {
        // Arrange
        final json = {
          'id': 1,
          'name': 'Bulbasaur',
          'generation': {'name': 'Gen I', 'url': 'https://example.com/gen1'},
          'effect_entries': [
            {
              'effect': 'Test effect',
              'short_effect': 'Test short effect',
              'language': {'name': 'en', 'url': 'https://example.com/lang/en'}
            }
          ]
        };

        // Act
        final result = PokemonModelUtils.fromJson(json);

        // Assert
        expect(result.id, equals(1));
        expect(result.name, equals('Bulbasaur'));
        expect(
          result.imageUrl,
          equals(
              'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/133.png'),
        );
        expect(result.generation, isNotNull);
        expect(result.generation!.name, equals('Gen I'));
        expect(result.generation!.url, equals('https://example.com/gen1'));
        expect(result.effectEntries, hasLength(1));
        expect(result.effectEntries.first.effect, equals('Test effect'));
        expect(result.effectEntries.first.shortEffect,
            equals('Test short effect'));
        expect(result.effectEntries.first.language!.name, equals('en'));
      });

      test('fromJson should handle missing generation', () {
        // Arrange
        final json = {
          'id': 1,
          'name': 'Bulbasaur',
          'generation': null,
          'effect_entries': [
            {
              'effect': 'Test effect',
              'short_effect': 'Test short effect',
              'language': {'name': 'en', 'url': 'https://example.com/lang/en'}
            }
          ]
        };

        // Act
        final result = PokemonModelUtils.fromJson(json);

        // Assert
        expect(result.generation, isNull);
      });

      test('fromJson should handle empty effect entries', () {
        // Arrange
        final json = {
          'id': 1,
          'name': 'Bulbasaur',
          'generation': null,
          'effect_entries': []
        };

        // Act
        final result = PokemonModelUtils.fromJson(json);

        // Assert
        expect(result.effectEntries, isEmpty);
      });
    });

    group('Model Instantiation', () {
      test('should create PokemonModel with all fields', () {
        // Arrange & Act
        final model = PokemonModel(
          1,
          'Bulbasaur',
          'https://example.com/bulbasaur.png',
          generation:
              PokemonGenerationModel('Gen I', 'https://example.com/gen1'),
          effectEntries: [
            PokemonEffectEntryModel(
              'Test effect',
              'Test short effect',
              language: PokemonEffectEntryLanguageModel(
                  'en', 'https://example.com/en'),
            ),
          ],
        );

        // Assert
        expect(model.id, equals(1));
        expect(model.name, equals('Bulbasaur'));
        expect(model.imageUrl, equals('https://example.com/bulbasaur.png'));
        expect(model.generation, isNotNull);
        expect(model.effectEntries, hasLength(1));
      });
    });
  });
}
