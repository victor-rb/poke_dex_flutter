import 'package:flutter/material.dart';
import 'package:poke_dex/models/PokemonDataModel.dart';
import 'package:poke_dex/screens/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

class WalkthroughScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<PokemonData>(context, listen: false);
    return SplashScreen(
      navigateAfterSeconds: HomeScreen(),
      seconds: 5,
      title: Text(
        "PKMDexGD",
        style: TextStyle(
          color: Colors.white,
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
      image: Image.asset("assets/images/pokedex.png"),
      photoSize: 100,
      backgroundColor: Colors.lightBlue,
      loaderColor: Colors.white,
      loadingText: Text(
        "Loading..",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white70,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
