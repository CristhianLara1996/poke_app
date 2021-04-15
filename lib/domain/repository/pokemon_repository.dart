import 'package:pokemon_app/domain/model/pokemon.dart';

abstract class PokemonRepositoryInterface {
  Future<List<Pokemon>> getPokemones();
}
