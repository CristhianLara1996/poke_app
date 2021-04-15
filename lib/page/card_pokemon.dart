import 'package:flutter/material.dart';
import 'package:pokemon_app/domain/model/pokemon_entry.dart';
import 'package:pokemon_app/page/detail_pokemon.dart';

class CardPokemon extends StatelessWidget {
  final List<PokemonEntry> pokemones;

  CardPokemon({@required this.pokemones});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: pokemones.length,
          itemBuilder: (context, i) {
            return _crearPost(context, i);
          }),
    );
  }

  Widget _crearPost(BuildContext context, int i) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPokemon(pokemon: pokemones[i]),
            ));
      },
      child: Card(
        elevation: 2,
        child: Container(
          color: Colors.black12,
          child: Column(
            children: <Widget>[
              Hero(
                tag: "pokemon${pokemones[i].id}",
                child: Container(
                  height: 200,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/img/loading.gif'),
                    image: NetworkImage(
                        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemones[i].id}.png"),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.only(
                  top: 5,
                  left: 7,
                  right: 7,
                  bottom: 1,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {},
                              icon: Image(
                                image: AssetImage('assets/img/pokeball.png'),
                                width: 30,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image(
                                color: Colors.black,
                                image: AssetImage('assets/img/heart.png'),
                                width: 35,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image(
                                image: AssetImage('assets/img/datos.png'),
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        left: 17,
                        right: 17,
                        bottom: 10,
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "${pokemones[i].pokemonSpecies.name.toUpperCase()} ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
