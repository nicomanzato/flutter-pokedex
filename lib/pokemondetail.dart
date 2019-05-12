import 'package:flutter/material.dart';
import 'package:pokedex/pokemon.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetail({this.pokemon});

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 70.0),
                  Text(pokemon.name,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  Text("Height: ${pokemon.height}"),
                  Text("Weight: ${pokemon.weight}"),
                  Text("Types", style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((type) => FilterChip(
                            disabledColor: Colors.amber,
                            label: Text(type),
                            onSelected: (null)))
                        .toList(),
                  ),
                  Text("Weakness", style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        .map((type) => FilterChip(
                            disabledColor: Colors.red,
                            label: Text(type,
                                style: TextStyle(color: Colors.black)
                            ),
                            onSelected: (null)))
                        .toList(),
                  ),
                  Text("Next Evolution", style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution != null ? pokemon.nextEvolution
                        .map((evolution) => FilterChip(
                            disabledColor: Colors.green,
                            label: Text(evolution.name),
                            onSelected: (null)))
                        .toList() : [Text("This pokemon doesn't have more evolutions")],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: pokemon.img,
                child: Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(pokemon.img))),
                )),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.cyan,
          title: Text(pokemon.name)),
      body: bodyWidget(context),
    );
  }
}
