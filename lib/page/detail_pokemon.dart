import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokemon_app/domain/model/pokemon.dart';
import 'package:pokemon_app/domain/model/pokemon_entry.dart';
import 'package:pokemon_app/domain/model/pokemon_type.dart';
import 'package:pokemon_app/providers/PokemonesProvider.dart';

class DetailPokemon extends StatelessWidget {
  final pokemonProvider = new PokemonesProvider();
  final PokemonEntry pokemon;

  DetailPokemon({@required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _crearAppbar(),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: 10,
            ),
            _posterTitulo(),
            // _descripcion(),
          ]))
        ],
      ),
    );
  }

  Widget _crearAppbar() {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.green,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          "${pokemon.pokemonSpecies.name}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        background: Hero(
          tag: 'pokemon${pokemon.id}',
          child: FadeInImage(
              placeholder: AssetImage('assets/img/loading.gif'),
              image: NetworkImage(
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.id}.png"),
              fadeInDuration: Duration(microseconds: 150),
              fit: BoxFit.contain),
        ),
      ),
    );
  }

  List<Widget> _crearTipo(List<PokemonType> types) {
    final random = Random();

    List<Widget> tempList = [];

    types.map((e) {
      final tempWidget = Chip(
        backgroundColor: Colors.black12,
        avatar: CircleAvatar(
          backgroundColor: Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            1,
          ),
          child: Text('${e.type.name.substring(0, 1).toUpperCase()}'),
        ),
        label: Text('${e.type.name}'),
      );
      tempList.add(tempWidget);
      tempList.add(
        SizedBox(
          width: 8,
        ),
      );
    }).toList();

    return tempList;
  }

  Widget _posterTitulo() {
    return Container(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: NetworkImage(
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon.id}.png"),
              height: 150,
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " Tipo",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                /* FutureBuilder(
                  future: pokemonProvider.getPokemon(pokemon.id),
                  builder: (context, AsyncSnapshot<Pokemon> snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        children: _crearTipo(snapshot.data.types),
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                        ],
                      );
                    }
                  },
                ),*/
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " Peso",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          " 15 KG",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Altura",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "7 M",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  /* Widget _descripcion() {
    return Container(
      height: 500,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: FutureBuilder(
        future: pokemonProvider.getPokemonSpecies(pokemon.id),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "* ${snapshot.data[i]}",
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  );
                });
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
*/
}
