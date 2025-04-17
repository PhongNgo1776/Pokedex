import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/search_pokemons_use_case.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_event.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_state.dart';
import 'package:rxdart/rxdart.dart';

class SearchPokemonsBloc
    extends Bloc<SearchPokemonsScreenEvent, SearchPokemonState> {
  SearchPokemonsBloc({required PokemonsUseCase searchPokemonsUseCase})
      : _searchPokemonsUseCase = searchPokemonsUseCase,
        super(SearchPokemonInit()) {
    on<SearchPokemonsEvent>(_searchPokemons,
        transformer: (events, mapper) =>
            events.debounceTime(Duration(milliseconds: 300)).switchMap(mapper));
    on<GetRandomPokemonsEvent>(_getRandomPokemons);
  }

  final PokemonsUseCase _searchPokemonsUseCase;

  Future<void> _searchPokemons(
      SearchPokemonsEvent event, Emitter<SearchPokemonState> emit) async {
    emit(SearchPokemonLoading());
    await _searchPokemonsUseCase
        .execute(idOrName: event.idOrName)
        .then((value) {
      emit(value != null
          ? SearchPokemonLoaded(pokemon: value)
          : SearchPokemonError(error: "Pokemon not found"));
    }).catchError((error) {
      emit(SearchPokemonError(error: error.toString()));
    });
  }

  Future<void> _getRandomPokemons(
      GetRandomPokemonsEvent event, Emitter<SearchPokemonState> emit) async {}
}
