import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/delete_pokemon_use_case.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/save_pokemon_use_case.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/abstract_pokemon_bloc.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/delete_pokemon_mixin.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/save_pokemon_mixin.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/get_random_pokemon_use_case.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/search_pokemons_use_case.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/cached_random_pokemons.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_event.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_state.dart';
import 'package:rxdart/rxdart.dart';

class SearchPokemonsBloc extends AbstractPokemonBloc<SearchPokemonState>
    with
        SavePokemonMixin<SearchPokemonState>,
        DeletePokemonMixin<SearchPokemonState> {
  final SearchPokemonUseCase _searchPokemonsUseCase;
  final GetRandomPokemonsUseCase _getRandomPokemonsUseCase;

  SearchPokemonsBloc(
      {required SearchPokemonUseCase searchPokemonsUseCase,
      required GetRandomPokemonsUseCase getRandomPokemonsUseCase,
      required SavePokemonUseCase savePokemonsUseCase,
      required DeletePokemonUseCase deletePokemonUseCase})
      : _searchPokemonsUseCase = searchPokemonsUseCase,
        _getRandomPokemonsUseCase = getRandomPokemonsUseCase,
        super(RandomPokemonsLoaded(
            pokedex: CachedRandomPokemons.latestRandomPokemons)) {
    on<SearchPokemonsEvent>(_searchPokemons,
        transformer: (events, mapper) =>
            events.debounceTime(Duration(milliseconds: 300)).switchMap(mapper));
    on<GetRandomPokemonsEvent>(_getRandomPokemons);
    on<ToggleFavoriteEvent>(_handelFavoritePokemon);
  }

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

  Future<void> _handelFavoritePokemon(
      ToggleFavoriteEvent event, Emitter<SearchPokemonState> emit) async {
    if (event.isFavorite) {
      savePokemonUseCase.execute(event.pokemon);
    } else {
      deletePokemonUseCase.execute(event.pokemon.id);
    }

    final newPokedex = (state as RandomPokemonsLoaded)
        .pokedex
        .map((pokemon) => pokemon.id == event.pokemon.id
            ? pokemon.copyWith(isFavorite: event.isFavorite)
            : pokemon)
        .toList();

    CachedRandomPokemons.latestRandomPokemons = newPokedex;
    emit(RandomPokemonsLoaded(pokedex: newPokedex));
  }

  Future<void> _getRandomPokemons(
      GetRandomPokemonsEvent event, Emitter<SearchPokemonState> emit) async {
    emit(SearchPokemonLoading());
    await _getRandomPokemonsUseCase.execute().then((value) {
      CachedRandomPokemons.latestRandomPokemons = value;
      emit(RandomPokemonsLoaded(pokedex: value));
    }).catchError((error) {
      emit(SearchPokemonError(error: error.toString()));
    });
  }
}
