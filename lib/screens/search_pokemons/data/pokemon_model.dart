import 'package:equatable/equatable.dart';

class PokemonModel implements Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String generation;
  final String effectEntries;

  const PokemonModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.generation,
    required this.effectEntries,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      generation: json['generation'] as String,
      effectEntries: json['effectEntries'] as String,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        generation,
        effectEntries,
      ];

  @override
  bool? get stringify => true;
}
