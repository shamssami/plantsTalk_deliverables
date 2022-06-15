import 'package:flutter/material.dart';
import 'package:plants_talk/Agriculture_guide/user.dart';

class item extends StatelessWidget {
  final User user;

  const item({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            child: Image.network(
          '${user.image}',
        )),
        Container(
          child: Text(
            '${user.name}',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
