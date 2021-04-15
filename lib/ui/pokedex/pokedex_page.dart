import 'package:flutter/material.dart';
import 'package:pokemon_app/data/datasource/pokemon_repository_impl.dart';
import 'package:pokemon_app/domain/model/pokemon.dart';
import 'package:pokemon_app/domain/repository/pokemon_repository.dart';
import 'package:pokemon_app/ui/poke_detail/poke_detail_page.dart';

// https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json
class PokedexPage extends StatefulWidget {
  const PokedexPage({Key key}) : super(key: key);

  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  List<Pokemon> pokemones;

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  _fetchData() async {
    PokemonRepositoryInterface pokemonRepositoryInterface =
        PokemonRepositoryImpl();
    pokemones = null;

    setState(() {});

    pokemones = await pokemonRepositoryInterface.getPokemones();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Container(
            color: Colors.black38,
            height: 0.75,
          ),
        ),
        backgroundColor: Colors.cyan,
        elevation: 0,
        centerTitle: true,
        title: Container(
          margin: EdgeInsets.only(top: 10),
          child: Text("PokeApp"),
        ),
      ),
      body: pokemones == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                Column(
                  children: [
                    Pokemones(
                      pokemones: pokemones,
                    ),
                  ],
                )
              ],
            ),
      floatingActionButton: _MyFab(
        onPressed: () {
          _fetchData();
        },
      ),
    );
  }
}

class Pokemones extends StatelessWidget {
  final List<Pokemon> pokemones;

  const Pokemones({Key key, this.pokemones}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(pokemones.length, (i) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PokeDetailPage(
                      pokemon: pokemones[i],
                    ),
                  ),
                );
              },
              child: Hero(
                tag: "poke:${pokemones[i].id}",
                child: Card(
                  elevation: 3.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("${pokemones[i].img}"),
                          ),
                        ),
                      ),
                      Text(
                        "${pokemones[i].name}",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class PokemonItem extends StatelessWidget {
  const PokemonItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => DetailPokemon(pokemon: pokemones[i]),
        //     ));
      },
      child: Card(
        elevation: 2,
        child: Container(
          color: Colors.black12,
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                child: FadeInImage(
                  placeholder: AssetImage('assets/img/loading.gif'),
                  image: NetworkImage(
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"),
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
                            "Pikachu",
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

class _MyFab extends StatelessWidget {
  final VoidCallback onPressed;

  _MyFab({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.cyan,
      child: Icon(Icons.refresh),
    );
  }
}
