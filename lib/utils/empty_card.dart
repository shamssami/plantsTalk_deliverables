// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plants_talk/services/result.dart';

class EmptyCard extends StatelessWidget {
  // final String title;
  EmptyCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(spacing: 10.0, children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.28,
            width: 150,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                GestureDetector(
                  onTap: () => print("Add Story Clicked"),
                  child: Column(
                    children: [
                      Container(
                        height: 130,
                        width: 150,
                        margin: EdgeInsets.only(bottom: 30.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: Image(
                            opacity: AlwaysStoppedAnimation<double>(0.9),
                            image: AssetImage('assets/images/addImage.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => {},
                        child: Text(
                          'التقط صورة',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 48.0,
                  left: 45.0,
                  child: IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.add_circle_rounded),
                    iconSize: 45.0,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

Widget SecondImage(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(10.0),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(spacing: 10.0, children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.28,
          width: 150,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              GestureDetector(
                onTap: () => print("Add Story Clicked"),
                child: Column(
                  children: [
                    Container(
                      height: 130,
                      width: 150,
                      margin: EdgeInsets.only(bottom: 30.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Image(
                          image: AssetImage('assets/images/addImage.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Positioned(
              //   bottom: 50.0,
              //   left: 45.0,
              //   child: IconButton(
              //     onPressed: () => {},
              //     icon: Icon(Icons.add_circle_rounded),
              //     iconSize: 45.0,
              //     color: Colors.blueAccent,
              //   ),
              // ),
            ],
          ),
        ),
      ]),
    ),
  );
}
