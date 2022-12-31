import 'package:flutter/material.dart';
import 'package:plants_talk/views/pages/agriculture_guide/Farm.dart';
import 'package:plants_talk/views/pages/agriculture_guide/HowToFarm.dart';
import 'package:plants_talk/views/pages/agriculture_guide/HowToPurn.dart';
import 'package:plants_talk/views/pages/agriculture_guide/Planting_Dates.dart';
import 'package:plants_talk/views/pages/agriculture_guide/cropsDates.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Agriculture Guide',
            style: TextStyle(fontSize: 20.0),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF0C9869)),

//bottomNavigationBar: BottomNavigationBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 300,
                height: 100,
                child: RaisedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Farm()));
                  },
                  icon: Icon(
                    Icons.agriculture_outlined,
                    size: 50.0,
                  ),
                  label: Text(
                    'How To Farm',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  color: Color(0xFF0C9869),
                )),

            SizedBox(height: 40),

            // second Contanier
            Container(
                width: 300,
                height: 100,
                child: RaisedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HowToPurn()));
                  },
                  icon: Icon(
                    Icons.cut,
                    size: 50.0,
                  ),
                  label: Text(
                    'How To Prune',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  color: Color(0xFF0C9869),
                )),

            // third  Contanier
            SizedBox(height: 40),
            Container(
                width: 300,
                height: 100,
                child: RaisedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => cropsDates()));
                  },
                  icon: Icon(
                    Icons.alarm,
                    size: 50.0,
                  ),
                  label: Text('Crop Dates    ',
                      style: TextStyle(
                        fontSize: 30.0,
                      )),
                  color: Color(0xFF0C9869),
                )),
          ],
        ),
      ),
    );
  }
}
