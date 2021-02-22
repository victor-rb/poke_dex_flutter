import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poke_dex/models/AbilityModel.dart';
import 'package:poke_dex/models/PokemonModel.dart';
import 'package:poke_dex/models/StatsModel.dart';

class PokemonService {
  final _baseURL = "https://pokeapi.co/api/v2/pokemon/";
  final _descUrl = "https://pokeapi.co/api/v2/pokemon-species/";

  Pokemon _pokemon = Pokemon();

  String _number;
  var _decodedData;

  Future<Pokemon> getPokemon({String number}) async {
    this._number = number;

    http.Response response = await http.get(_baseURL + _number);

    if (response.statusCode == 200) {
      _decodedData = jsonDecode(response.body);

      _pokemon.name = _decodedData['name'].toString().toUpperCase();
      _pokemon.sprites = _decodedData['sprites']['front_default'];
      _pokemon.weight = _decodedData['weight'];

      _getStatus();
      _getType();
      await _getAbility();
      await _getDescription();

      return _pokemon;
    } else
      return _pokemon;
  }

  _getStatus() {
    for (var i = 0; i < 6; i++) {
      _pokemon.stats.add(
        Stats(
          statusName:
              _decodedData['stats'][i]['stat']['name'].toString().toUpperCase(),
          value: _decodedData['stats'][i]['base_stat'],
        ),
      );
    }
  }

  _getType() {
    var count = _decodedData['types'].length;

    for (var i = 0; i < count; i++) {
      _pokemon.type.add(_decodedData['types'][i]['type']['name']);
    }
  }

  _getDescription() async {
    http.Response response = await http.get(_descUrl + _number);

    if (response.statusCode == 200) {
      _decodedData = jsonDecode(response.body);

      int index = 0;

      while (_decodedData['flavor_text_entries'][index]['language']['name'] !=
          'en') {
        index++;
      }

      _pokemon.description =
          _decodedData['flavor_text_entries'][index]['flavor_text'];

      _setColor(_decodedData['color']['name']);
    }
  }

  _setColor(String data) {
    var color;

    switch (data) {
      case 'black':
        color = Colors.black;
        break;
      case 'blue':
        color = Colors.blue;
        break;
      case 'brown':
        color = Colors.brown;
        break;
      case 'gray':
        color = Colors.grey;
        break;
      case 'green':
        color = Colors.green;
        break;
      case 'pink':
        color = Colors.pink;
        break;
      case 'purple':
        color = Colors.purple;
        break;
      case 'red':
        color = Colors.red;
        break;
      case 'white':
        color = Colors.white;
        break;
      case 'yellow':
        color = Colors.yellow;
        break;
    }

    _pokemon.color = color;
  }

  _getAbility() async {
    var count = _decodedData['abilities'].length;

    for (var i = 0; i < count; i++) {
      var _url = _decodedData['abilities'][i]['ability']['url'];

      http.Response response = await http.get(_url);

      if (response.statusCode == 200) {
        var _decodedAbilityData = jsonDecode(response.body);

        int effectIndex = 0;
        int descIndex = 0;

        while (_decodedAbilityData['effect_entries'][effectIndex]['language']
                ['name'] !=
            'en') {
          effectIndex++;
        }

        while (_decodedAbilityData['flavor_text_entries'][descIndex]['language']
                ['name'] !=
            'en') {
          descIndex++;
        }

        _pokemon.ability.add(
          Ability(
            abilityName: _decodedData['abilities'][i]['ability']['name'],
            abilityDesc: _decodedAbilityData['effect_entries'][effectIndex]
                ['effect'],
            abilityEffect: _decodedAbilityData['flavor_text_entries'][descIndex]
                ['flavor_text'],
          ),
        );
      }
    }
  }
}
