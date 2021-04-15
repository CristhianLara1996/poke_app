class PokemonSpecies {
  PokemonSpecies({
    this.name,
    this.url,
  });

  String name;
  String url;

  PokemonSpecies.fromJsonMap(Map<String, dynamic> json) {
    name = json["name"];
    url = json["url"];
  }
}
