import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/abstract_pokemon_bloc.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/delete_pokemon_mixin.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/pokemon_event.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/domain/get_my_pokedex_use_case.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_state.dart';

class MyPokedexBloc extends AbstractPokemonBloc<MyPokedexState>
    with DeletePokemonMixin<MyPokedexState> {
  MyPokedexBloc({required GetMyPokedexUseCase getMyPokedexUseCase})
      : super(MyPokedexState(
          pokemons: getMyPokedexUseCase.execute(),
        )) {
    on<ToggleFavoriteEvent>(_handelFavoritePokemon);
  }

  Future<void> _handelFavoritePokemon(
      ToggleFavoriteEvent event, Emitter<MyPokedexState> emit) async {
    if (!event.isFavorite) {
      deletePokemonUseCase.execute(event.pokemon.id);
    }
  }
}
