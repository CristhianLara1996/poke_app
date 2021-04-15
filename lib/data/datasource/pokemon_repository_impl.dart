import 'package:pokemon_app/core/http_manager.dart';
import 'package:pokemon_app/domain/model/pokedex.dart';
import 'package:pokemon_app/domain/model/pokemon.dart';
import 'package:pokemon_app/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepositoryInterface {
  @override
  Future<List<Pokemon>> getPokemones() async {
    HttpManager http = HttpManager();

    try {
      final res = await http.get(
          "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");

      print(res);

      if (res == null) return null;
      final Pokedex pokedex = Pokedex.fromJsonList(res["pokemon"]);

      return pokedex.items;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
