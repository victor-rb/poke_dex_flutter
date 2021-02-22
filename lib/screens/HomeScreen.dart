import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:poke_dex/models/PokemonDataModel.dart';
import 'package:poke_dex/widgets/SearchWidget.dart';
import 'package:poke_dex/widgets/StatsWidget.dart';
import 'package:poke_dex/widgets/TypesWidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _title = Text("Pokemon");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: _title,
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                _title = await searchBar(context: context);
                setState(() {});
              }),
        ],
      ),
      backgroundColor: Color(0xfff9fff5),
      body: Consumer<PokemonData>(
        builder: (context, pokemonData, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CircleAvatar(
                            radius: 51,
                            backgroundColor: pokemonData.pokemon.color,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey[100],
                              backgroundImage:
                                  NetworkImage(pokemonData.pokemon.sprites),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  pokemonData.pokemon.name,
                  style: TextStyle(
                    fontSize: 25,
                    color: pokemonData.pokemon.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: typeList(types: pokemonData.pokemon.type),
                  ),
                ),
                Divider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  pokemonData.pokemon.description,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            ),
                          )),
                      VerticalDivider(),
                      Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 20, 0, 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: statsList(pokemonData.pokemon.stats),
                            ),
                          )),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
