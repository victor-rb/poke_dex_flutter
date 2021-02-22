import 'package:flutter/material.dart';
import 'package:poke_dex/models/PokemonDataModel.dart';
import 'package:provider/provider.dart';

Future<Widget> searchBar({@required BuildContext context}) async {
  final nameHolder = TextEditingController();

  clearTextInputs() {
    nameHolder.clear();
  }

  return TextField(
    controller: nameHolder,
    autofocus: true,
    cursorColor: Colors.white,
    textAlign: TextAlign.center,
    showCursor: false,
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
    decoration: InputDecoration(
      hintText: 'Search Pokemon',
      alignLabelWithHint: true,
      hintStyle: TextStyle(
        color: Colors.white,
        fontSize: 17,
      ),
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
    ),
    onSubmitted: (text) async {
      Provider.of<PokemonData>(context, listen: false).updatePokemon(text);
      clearTextInputs();
    },
  );
}
