import 'package:pokemon_app/domain/model/pokemon_species.dart';

class PokemonEntry {
  PokemonEntry({
    this.id,
    this.pokemonSpecies,
  });

  int id;
  PokemonSpecies pokemonSpecies;

  PokemonEntry.fromJsonMap(Map<String, dynamic> json) {
    id = json["entry_number"];
    pokemonSpecies = PokemonSpecies.fromJsonMap(json["pokemon_species"]);
  }

  String getPosterImg() {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
  }
}
