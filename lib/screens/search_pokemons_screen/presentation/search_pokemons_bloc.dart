import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/search_pokemons_use_case.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_event.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_state.dart';
import 'package:rxdart/rxdart.dart';

class SearchPokemonsBloc
    extends Bloc<SearchPokemonsScreenEvent, SearchPokemonsState> {
  SearchPokemonsBloc({required PokemonsUseCase searchPokemonsUseCase})
      : _searchPokemonsUseCase = searchPokemonsUseCase,
        super(const SearchPokemonsState()) {
    on<SearchPokemonsEvent>(_searchPokemons,
        transformer: (events, mapper) =>
            events.debounceTime(Duration(milliseconds: 300)).switchMap(mapper));
    on<GetRandomPokemonsEvent>(_getRandomPokemons);
  }

  final PokemonsUseCase _searchPokemonsUseCase;

  Future<void> _searchPokemons(
      SearchPokemonsEvent event, Emitter<SearchPokemonsState> emit) async {
    emit(SearchPokemonsState(isLoading: true));
    await _searchPokemonsUseCase
        .execute(idOrName: event.idOrName)
        .then((value) {
      emit(SearchPokemonsState(isLoading: false, pokemons: value));
    }).catchError((error) {
      emit(SearchPokemonsState(isLoading: false, error: error.toString()));
    });
  }

  Future<void> _getRandomPokemons(
      GetRandomPokemonsEvent event, Emitter<SearchPokemonsState> emit) async {}
}
