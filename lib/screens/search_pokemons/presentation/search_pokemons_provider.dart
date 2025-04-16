import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/screens/search_pokemons/domain/search_pokemons_use_case.dart';
import 'package:phongngo.pokedex/screens/search_pokemons/presentation/search_pokemons_events.dart';
import 'package:phongngo.pokedex/screens/search_pokemons/presentation/search_pokemons_state.dart';

class SearchPokemonsBloc
    extends Bloc<SearchPokemonsScreenEvent, SearchPokemonsState> {
  SearchPokemonsBloc({required PokemonsUseCase searchPokemonsUseCase})
      : _searchPokemonsUseCase = searchPokemonsUseCase,
        super(const SearchPokemonsState()) {
    on<SearchPokemonsEvent>(_searchPokemons);
    on<GetRandomPokemonsEvent>(_getRandomPokemons);
  }

  final PokemonsUseCase _searchPokemonsUseCase;

  Future<void> _searchPokemons(
      SearchPokemonsEvent event, Emitter<SearchPokemonsState> emit) async {
    emit(SearchPokemonsState(isLoading: true));
    await _searchPokemonsUseCase
        .execute(id: event.id, name: event.name)
        .then((value) {
      emit(SearchPokemonsState(isLoading: false, pokemons: value));
    }).catchError((error) {
      emit(SearchPokemonsState(isLoading: false, error: error.toString()));
    });
  }

  Future<void> _getRandomPokemons(
      GetRandomPokemonsEvent event, Emitter<SearchPokemonsState> emit) async {}
}
