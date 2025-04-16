import 'package:equatable/equatable.dart';

abstract class SearchPokemonsScreenEvent extends Equatable {
  const SearchPokemonsScreenEvent();

  @override
  List<Object> get props => [];
}

class GetRandomPokemonsEvent extends SearchPokemonsScreenEvent {}

class SearchPokemonsEvent extends SearchPokemonsScreenEvent {
  final String id;
  final String name;

  const SearchPokemonsEvent({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
