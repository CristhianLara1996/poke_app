import 'package:pokemon_app/domain/model/pokemon.dart';

class Pokedex {
  List<Pokemon> items = new List();

  Pokedex();

  Pokedex.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final address = new Pokemon.fromJsonMap(item);
      items.add(address);
    }
  }
}
