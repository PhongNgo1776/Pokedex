import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/abstract_pokemon_bloc.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/delete_pokemon_mixin.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/domain/get_my_pokedex_use_case.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/domain/update_my_pokedex_use_case.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_event.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_state.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/cached_random_pokemons.dart';

class MyPokedexBloc extends AbstractPokemonBloc<MyPokedexState>
    with DeletePokemonMixin<MyPokedexState> {
  final UpdateMyPokedexUseCase _updateMyPokedexUseCase;
  MyPokedexBloc(
      {required GetMyPokedexUseCase getMyPokedexUseCase,
      required UpdateMyPokedexUseCase updateMyPokedexUseCase})
      : _updateMyPokedexUseCase = updateMyPokedexUseCase,
        super(MyPokedexState(
          pokedex: getMyPokedexUseCase.execute(),
        )) {
    on<DeletePokemonEvent>(_deletePokemon);
    on<ReOrderPokedexEvent>(_reOrderPokedex);
  }

  Future<void> _deletePokemon(
      DeletePokemonEvent event, Emitter<MyPokedexState> emit) async {
    deletePokemonUseCase.execute(event.pokemon.id);
    final index = CachedRandomPokemons.latestRandomPokemons
        .indexWhere((pokemon) => pokemon.id == event.pokemon.id);

    if (index != -1) {
      CachedRandomPokemons.latestRandomPokemons.removeAt(index);
      CachedRandomPokemons.latestRandomPokemons
          .insert(index, event.pokemon.copyWith(isFavorite: false));
    }

    emit(state.copyWith(
        pokedex: state.pokedex
          ..removeWhere((pokemon) => pokemon.id == event.pokemon.id)));
  }

  Future<void> _reOrderPokedex(
      ReOrderPokedexEvent event, Emitter<MyPokedexState> emit) async {
    final pokedex = state.pokedex;
    final pokemon = pokedex.removeAt(event.oldIndex);
    pokedex.insert(event.newIndex, pokemon);
    emit(state.copyWith(pokedex: pokedex));
    _updateMyPokedexUseCase.execute(pokedex);
  }
}
