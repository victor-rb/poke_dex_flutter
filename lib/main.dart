import 'package:flutter/material.dart';
import 'package:poke_dex/models/PokemonDataModel.dart';
import 'package:poke_dex/screens/WalkthroughScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonData(),
      child: MaterialApp(
        home: WalkthroughScreen(),
      ),
    );
  }
}
