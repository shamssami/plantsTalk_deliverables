import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhdh0Zaai-XFcU5DrCJIQxuP0tkJwx7m4xOw&usqp=CAU',
  'https://4.bp.blogspot.com/-HPZE5n5q-t4/W-UCMNDWisI/AAAAAAAAAUI/nKtioQcnSMo_uKqRqzWGfDS4nB5wimKXQCLcBGAs/s320/1541730427463.png',
  'https://i0.wp.com/faharas.net/wp-content/uploads/2020/10/Organic-Insecticide.jpg?fit=750%2C430&ssl=1',
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal.shade800,
        title: Text("PlantsTalk"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
            ),
            CarouselSlider(
              items: imgList
                  .map((item) => Container(
                        child: Center(
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: 1000,
                          ),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //    CarouselWithDotsPage(imgList: imgList),
          ],
        ),
      ),
    );
  }
}
