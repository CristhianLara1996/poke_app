import 'package:http/http.dart' as http;
import 'package:pokemon_app/domain/model/pokedex.dart';
import 'package:pokemon_app/domain/model/pokemon.dart';
import 'dart:convert';
import 'package:pokemon_app/domain/model/pokemon_entry.dart';

class PokemonesProvider {
  /* String _url = 'pokeapi.co';

  Future<List<PokemonEntry>> getPokemones() async {
    final url = Uri.https(_url, '/api/v2/pokedex/1/');

    final res = await http.get(url);
    final decodeData = json.decode(res.body);
    final pokedex = new Pokedex.fromJsonList(decodeData['pokemon_entries']);

    // print(pokedex.pokemonEntries[5].id);
    // print(pokedex.pokemonEntries[5].pokemonSpecies.name);

    return pokedex.pokemonEntries;
  }

  Future<Pokemon> getPokemon(int id) async {
    print("id: $id");
    final url = Uri.https(_url, '/api/v2/pokemon/$id/');

    final res = await http.get(url);
    final decodeData = json.decode(res.body);
    print(decodeData['weight']);
    final pokemon = new Pokemon.fromJsonMap(decodeData);

    return pokemon;
  }

  Future<List<String>> getPokemonSpecies(int id) async {
    final url = Uri.https(_url, '/api/v2/pokemon-species/$id');

    final res = await http.get(url);
    final decodeData = json.decode(res.body);
    List<String> descripcion = [];
    for (var item in decodeData['flavor_text_entries']) {
      if (item['language']['name'] == 'es') {
        descripcion.add(item['flavor_text']);
      }
    }

    return descripcion;
  }*/
}
