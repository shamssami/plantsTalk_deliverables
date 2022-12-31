import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:plants_talk/model/plant.dart';
import 'package:plants_talk/views/pages/agriculture_guide/testitem.dart';

class Grains extends StatefulWidget {
  const Grains({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Grains> {
  List<Plant> _plants = [
    Plant(1, 'قمح', 'https://pngimg.com/uploads/wheat/wheat_PNG79.png',
        "32-30 °س", "طينية", "تشرين الاول - تشرين الثاني", "3 سنوات"),
    Plant(
        2,
        'الشعير',
        'https://www.pngarts.com/files/3/Barley-Transparent-Background-PNG.png',
        "15-12 °س ",
        "الرملية",
        "تشرين الثاني",
        "6 أشهر"),
    Plant(
        3,
        'حمص',
        'https://www.pngplay.com/wp-content/uploads/13/Garbanzo-Beans-Free-PNG.png',
        "30-24 °س ",
        "الرملية",
        "تشرين الثاني",
        "6 أشهر"),
    Plant(
        4,
        'الذرة',
        'https://www.pngplay.com/wp-content/uploads/4/Corn-Background-PNG-Image.png',
        "12-10 °س ",
        "الطينية",
        "حزيران",
        "3 أشهر"),
    Plant(
        5,
        'الفول',
        'https://starpng.com/public/uploads/preview/dry-beans-png-shady-side-farm-hidatsa-certified-organic-heirloom-beans-lb-101576783515jll7tzruio.png',
        "25-13 °س ",
        "الطينية الثقيلة",
        "تشرين الاول = تشرين الثاني",
        "10-12 أسابيع"),
    Plant(6, 'اللوبيا', 'https://my.all.biz/img/my/catalog/66440.JPG',
        "90-75 °س ", "الطينية والرملية", "شباط - أذار", "45-90 يوم"),
    Plant(
        7,
        'العدس',
        'https://care4mall.online/wp-content/uploads/2021/03/ygjhgjh.png',
        "68 °س ",
        "خصبة",
        "أذار",
        "80-120 يوم"),
    Plant(
        8,
        'الترمس',
        'https://cdn.altibbi.com/cdn/cache/1000x500/image/2020/09/17/9a1c450d432e3fd5e6ee399b3911a211.png.webp',
        "18 °س ",
        "الرملية",
        "تشرين الأول - تشرين الثاني",
        "5 أشهر"),
    // Plant(9,'Grapes',  'https://www.pngplay.com/wp-content/uploads/10/Grape-Transparent-PNG.png', "22 °C ","Gravel Soil","February - April","6 Months"),
    // Plant(10,'Cabbage',  'https://www.i2clipart.com/cliparts/5/6/9/1/clipart-cabbage-512x512-5691.png', "24-26 °C ","Fertile Soil","August - September","2.5-3 Months")
  ];

  List<Plant> _foundedPlants = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _foundedPlants = _plants;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedPlants = _plants
          .where((plant) => plant.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal.shade100,
        title: Container(
          height: 38,
          child: TextField(
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.teal.shade700,
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                hintText: "بحث"),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: _foundedPlants.length > 0
            ? ListView.builder(
                itemCount: _foundedPlants.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: plantComponent(plant: _foundedPlants[index]),
                    actions: <Widget>[
                      new IconSlideAction(
                        caption: 'Archive',
                        color: Colors.red,
                        icon: Icons.archive,
                        onTap: () => print("archive"),
                      ),
                      new IconSlideAction(
                        caption: 'Share',
                        color: Colors.red,
                        icon: Icons.share,
                        onTap: () => print('Share'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      new IconSlideAction(
                        caption: 'More',
                        color: Colors.red,
                        icon: Icons.more_horiz,
                        onTap: () => print('More'),
                      ),
                      new IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () => print('Delete'),
                      ),
                    ],
                  );
                })
            : Center(
                child: Text(
                "لا يوجد عناصر",
                style: TextStyle(color: Colors.white),
              )),
      ),
    );
  }

  plantComponent({required Plant plant}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(plant.image),
                )),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(plant.name,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 5,
              ),
              //   Text(plant.username, style: TextStyle(color: Colors.grey[500])),
            ])
          ]),
          GestureDetector(
              onTap: () {
                if (plant.index == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                plant: plant,
                              )));
                  // log("Index number is: ${plant.image}");

                }
                if (plant.index == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                plant: plant,
                              )));
                  // log("Index number is: ${plant.image}");

                }
                if (plant.index == 3) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                plant: plant,
                              )));
                  // log("Index number is: ${plant.image}");

                }
                if (plant.index == 4) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                plant: plant,
                              )));
                }
                if (plant.index == 5) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                plant: plant,
                              )));
                }
                if (plant.index == 6) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                plant: plant,
                              )));
                }
                if (plant.index == 7) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                plant: plant,
                              )));
                }
                if (plant.index == 8) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                plant: plant,
                              )));
                }
                if (plant.index == 9) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                plant: plant,
                              )));
                }
                if (plant.index == 10) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                plant: plant,
                              )));
                }
              },
              child: AnimatedContainer(
                  height: 35,
                  width: 110,
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                      color: Colors.teal.shade700,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.white,
                      )),
                  child: Center(
                      child:
                          Text('عرض', style: TextStyle(color: Colors.white))))),
        ],
      ),
    );
  }
}