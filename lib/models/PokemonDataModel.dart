import 'package:flutter/foundation.dart';
import 'package:poke_dex/Services/PokemonService.dart';

import 'PokemonModel.dart';

class PokemonData extends ChangeNotifier {
  Pokemon pokemon;
  PokemonData() {
    _setPokemonData('1');
  }

  _setPokemonData(String number) async {
    pokemon = await PokemonService().getPokemon(number: number);
  }

  void updatePokemon(String number) async {
    pokemon = await PokemonService().getPokemon(number: number);
    print(pokemon.name);
    notifyListeners();
  }
}
