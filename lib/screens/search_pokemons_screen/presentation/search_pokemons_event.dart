import 'package:equatable/equatable.dart';

abstract class SearchPokemonsScreenEvent extends Equatable {
  const SearchPokemonsScreenEvent();

  @override
  List<Object> get props => [];
}

class GetRandomPokemonsEvent extends SearchPokemonsScreenEvent {}

class SearchPokemonsEvent extends SearchPokemonsScreenEvent {
  final String idOrName;

  const SearchPokemonsEvent({
    required this.idOrName,
  });

  @override
  List<Object> get props => [idOrName];
}
