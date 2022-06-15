import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plants_talk/services/result.dart';

class ItemCard extends StatelessWidget {
  final String title, photo;
  // ignore: use_key_in_widget_constructors
  const ItemCard({required this.title, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 3, right: 3),
        child: GestureDetector(
          onTap: () {
            // Check disease name ther pass it to resultPage() function which redirect it to the suite page...
            ResultPage().resultPage(context, this.title, this.photo);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: 150,
                  child: Image.network(
                    photo,
                    fit: BoxFit.fill,
                  ),
                  color: Colors.teal.shade800,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
