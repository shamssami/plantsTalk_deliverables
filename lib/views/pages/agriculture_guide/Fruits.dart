import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:plants_talk/model/plant.dart';
import 'package:plants_talk/views/pages/agriculture_guide/testitem.dart';

class Fruits extends StatefulWidget {
  const Fruits({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Fruits> {
  List<Plant> _plants = [
    Plant(
        1,
        'موز',
        'https://us.123rf.com/450wm/atoss/atoss1802/atoss180200082/atoss180200082.jpg?ver=6',
        "15-45 °س",
        "خصبة طينية",
        "تشرين الأول - تشرين الثاني",
        "6-7 أشهر"),
    Plant(
        2,
        'تفاح',
        'https://1.bp.blogspot.com/-YVELVCjND2w/UwipnL3CVZI/AAAAAAAAApM/HfgLEFprRKA/s1600/%D8%B5%D9%88%D8%B1%D8%A9+%D8%AA%D9%81%D8%A7%D8%AD%D8%A9+%D8%AD%D9%85%D8%B1%D8%A7%D8%A1+%D9%86%D8%A7%D8%B6%D8%AC%D8%A9+%D8%A8%D9%88%D8%B1%D9%82%D8%A9+%D8%AE%D8%B6%D8%B1%D8%A7%D8%A1+%D9%85%D9%81%D8%B1%D8%BA%D8%A9+%D8%B4%D9%81%D8%A7%D9%81%D8%A9+%D8%A7%D9%84%D8%AE%D9%84%D9%81%D9%8A%D8%A9+%D9%84%D9%84%D8%AA%D8%B5%D9%85%D9%8A%D9%85.png',
        "18-20 °س ",
        "رملية",
        "تشرين الأول - تشرين الثاني",
        "11-12 أشهر"),
    Plant(
        3,
        'اناناس',
        'https://draw.k3ki.com/wp-content/uploads/2016/05/%D9%83%D9%8A%D9%81%D9%8A%D8%A9-%D8%B1%D8%B3%D9%85-%D8%A3%D9%86%D8%A7%D9%86%D8%A7%D8%B3.png',
        "+18 °س ",
        "رملية",
        "شباط - نيسان",
        "9 أشهر"),
    //Plant(4,'Wheat',  '', "15-20 °C ", "Heavy Sandy Clay","September - October","3-5 Months"),
    Plant(
        5,
        'كيوي',
        'https://www.pngplay.com/wp-content/uploads/12/Cool-Kiwi-Juice-PNG-HD-Quality.png',
        "-8 °س ",
        "خصبة",
        "أذار - نيسان",
        "6 أشهر"),
    Plant(
        6,
        'إجاص',
        'https://creazilla-store.fra1.digitaloceanspaces.com/emojis/46851/pear-emoji-clipart-md.png',
        "-7 °س ",
        "الطينية",
        "كانون الثاني - أذار",
        "110 - 115 يوم"),
    Plant(
        7,
        'بطيخ',
        'https://www.pinclipart.com/picdir/big/557-5570134_cartoon-transparent-background-watermelon-clipart.png',
        "28 °س ",
        "الرملية الخفيفة",
        "أذار - نيسان",
        "100 يوم"),
    // Plant(8,'Zucchini', 'https://cdn-icons-png.flaticon.com/512/1515/1515034.png', "21-35 °C ","Wet Soil","March - April","30-35 Days"),
    Plant(
        9,
        'عنب',
        'https://www.pngplay.com/wp-content/uploads/10/Grape-Transparent-PNG.png',
        "22 °س ",
        "الحصى",
        "شباط - نيسان",
        "6 أشهر"),
    Plant(
        9,
        'فراولة',
        'https://freepngdownload.com/image/thumb/strawberry-png-free-download-9.png',
        "24-20 °س ",
        "الرملية أو الصفراء",
        "أيلول - تشرين الأول",
        "3 أشهر"),
    //  Plant(10,'Cabbage',  'https://www.i2clipart.com/cliparts/5/6/9/1/clipart-cabbage-512x512-5691.png', "24-26 °C ","Fertile Soil","August - September","2.5-3 Months")
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
          .where((user) => user.name.toLowerCase().contains(search))
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
              //   Text(plant.plantname, style: TextStyle(color: Colors.grey[500])),
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
                  // log("Index number is: ${Plant.image}");

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
