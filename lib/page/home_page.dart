import 'package:flutter/material.dart';
import 'package:pokemon_app/providers/PokemonesProvider.dart';

class HomePage extends StatelessWidget {
  final pokemonProvider = new PokemonesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
    );
  }

  Widget _appBar() {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.5),
        child: Container(
          color: Colors.black38,
          height: 0.75,
        ),
      ),
      backgroundColor: Colors.redAccent,
      elevation: 0,
      centerTitle: true,
      title: Container(
        margin: EdgeInsets.only(top: 10),
        child: Text("PokeApp"),
      ),
    );
  }
}
