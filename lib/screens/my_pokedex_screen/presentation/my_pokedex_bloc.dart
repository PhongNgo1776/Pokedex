import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/abstract_pokemon_bloc.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/delete_pokemon_mixin.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/pokemon_event.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/domain/get_my_pokedex_use_case.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/domain/update_my_pokedex_use_case.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_event.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_state.dart';

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
    on<ToggleFavoriteEvent>(_handelFavoritePokemon);
    on<ReOrderPokedexEvent>(_handleReOrderPokedex);
  }

  Future<void> _handelFavoritePokemon(
      ToggleFavoriteEvent event, Emitter<MyPokedexState> emit) async {
    if (!event.isFavorite) {
      deletePokemonUseCase.execute(event.pokemon.id);
    }
  }

  Future<void> _handleReOrderPokedex(
      ReOrderPokedexEvent event, Emitter<MyPokedexState> emit) async {
    final pokedex = state.pokedex;
    final pokemon = pokedex.removeAt(event.oldIndex);
    pokedex.insert(event.newIndex, pokemon);
    emit(state.copyWith(pokedex: pokedex));
    _updateMyPokedexUseCase.execute(pokedex);
  }
}
