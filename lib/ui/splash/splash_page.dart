import 'package:flutter/material.dart';
import 'package:pokemon_app/ui/pokedex/pokedex_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void _init() async {
    await Future.delayed(Duration(milliseconds: 2000));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => PokedexPage(),
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Image.asset(
                  "assets/img/logo.png",
                  height: 250,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
