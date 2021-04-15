import 'package:flutter/material.dart';
import 'package:pokemon_app/domain/model/pokemon.dart';

class PokeDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokeDetailPage({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        centerTitle: true,
        title: Text("${pokemon.name}"),
      ),
      body: Stack(
        children: [
          Positioned(
            height: size.height / 1.5,
            width: size.width - 20,
            left: 10,
            top: size.height * .1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    "${pokemon.name}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text("Tamaño: ${pokemon.height}"),
                  Text("Peso: ${pokemon.weight}"),
                  Text(
                    "Tipo",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      pokemon.type.length,
                      (i) => FilterChip(
                          backgroundColor: Colors.amber,
                          label: Text("${pokemon.type[i]}"),
                          onSelected: (b) {}),
                    ),
                  ),
                  Text(
                    "Debilidad",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      pokemon.weaknesses.length,
                      (i) => FilterChip(
                          backgroundColor:
                              Colors.accents[i % Colors.accents.length],
                          label: Text(
                            "${pokemon.weaknesses[i]}",
                            style: TextStyle(color: Colors.white),
                          ),
                          onSelected: (b) {}),
                    ),
                  ),
                  Text(
                    "Siguiente evolución",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      pokemon.nextEvolution.length,
                      (i) => FilterChip(
                          backgroundColor:
                              Colors.accents[i % Colors.accents.length],
                          label: Text(
                            "${pokemon.nextEvolution[i].name}",
                            style: TextStyle(color: Colors.white),
                          ),
                          onSelected: (b) {}),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: "poke:${pokemon.id}",
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "${pokemon.img}",
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
