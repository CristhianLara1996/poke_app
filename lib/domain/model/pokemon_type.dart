import 'package:pokemon_app/domain/model/pokemon_species.dart';

class PokemonType {
  PokemonType({
    this.slot,
    this.type,
  });

  int slot;
  PokemonSpecies type;

  factory PokemonType.fromJsonMap(Map<String, dynamic> json) => PokemonType(
        slot: json["slot"],
        type: PokemonSpecies.fromJsonMap(json["type"]),
      );
}
