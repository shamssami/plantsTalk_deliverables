import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:plants_talk/model/plant.dart';
import 'package:plants_talk/views/pages/agriculture_guide/testitem.dart';

class Herbs extends StatefulWidget {
  const Herbs({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Herbs> {
  List<Plant> _plants = [
    Plant(
        1,
        'نعناع',
        'https://1.bp.blogspot.com/-4Vaq107O7pM/Xp2EQO-gm8I/AAAAAAAABKs/sESOxHSH4Ng7F5C0IpYmGH7iGs9Shuq3QCK4BGAsYHg/s1600/%25D9%2586%25D8%25B9%25D9%2586%25D8%25A7%25D8%25B9.png',
        "21-18 °س",
        "تربة خصبة",
        "شباط - أذار",
        "70 يوم"),
    Plant(
        2,
        'مريمية',
        'https://pngimage.net/wp-content/uploads/2018/06/sage-png-6.png',
        "21-15 °س ",
        "الجافة الصفراء",
        "اّب - كانون الثاني.",
        "9 أشهر"),
    Plant(
        3,
        'اليانسون',
        'https://www.pngkey.com/png/full/254-2547460_star-anise-seeds-png.png',
        "25-20 °س ",
        "صفراء خصبة",
        "شباط",
        "4 أشهر"),
    Plant(
        4,
        'بابونج',
        'https://www.pngplay.com/wp-content/uploads/2/Chamomile-Flower-Background-PNG-Image.png',
        "20-16°س ",
        "طينية خصبة",
        "أيلول",
        "6 أشهر"),
    Plant(
        5,
        'اكليل الجبل',
        'https://www.pngplay.com/wp-content/uploads/9/Rosemary-Background-PNG-Image.png',
        "24-6 °س ",
        "رطبة",
        "أذار/ كانون الاول",
        "15-21 أشهر"),
    Plant(
        6,
        'الشاي الاخضر',
        'https://www.pngmart.com/files/4/Green-Tea-Transparent-Background.png',
        "30-10 °س ",
        "العميقة",
        "طوال العام",
        "6-8 أسابيع"),
    Plant(
        7,
        'الشومر',
        'https://www.flavourfields.com/pub/media/catalog/product/cache/e4d64343b1bc593f1c5348fe05efa4a6/s/e/sea_fennel.png',
        "+6 °س ",
        "القطن السوداء",
        "أيلول - تشرين الاول",
        "5-7 أشهر"),
    Plant(
        8,
        'الزنجبيل',
        'https://www.pngmart.com/files/5/Ginger-PNG-Transparent-Image.png',
        "21 °س ",
        "طافلية",
        "أذار",
        "8-10 أشهر"),
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
                        color: Color(0xFF00695C),
                        icon: Icons.archive,
                        onTap: () => print("archive"),
                      ),
                      new IconSlideAction(
                        caption: 'Share',
                        color: Color(0xFF00695C),
                        icon: Icons.share,
                        onTap: () => print('Share'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      new IconSlideAction(
                        caption: 'More',
                        color: Color(0xFF00695C),
                        icon: Icons.more_horiz,
                        onTap: () => print('More'),
                      ),
                      new IconSlideAction(
                        caption: 'Delete',
                        color: Color(0xFF00695C),
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
              //   Text(user.username, style: TextStyle(color: Colors.grey[500])),
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
