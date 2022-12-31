import 'package:flutter/material.dart';
import 'package:plants_talk/model/plant.dart';

class item extends StatelessWidget {
  final Plant plant;

  const item({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            child: Image.network(
          '${plant.image}',
        )),
        Container(
          child: Text(
            '${plant.name}',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
