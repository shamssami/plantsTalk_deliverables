import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:plants_talk/Agriculture_guide/item.dart';
import 'package:plants_talk/Agriculture_guide/testitem.dart';
import 'package:plants_talk/Agriculture_guide/user.dart';

class Vegetables extends StatefulWidget {
  const Vegetables({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Vegetables> {
  List<User> _users = [
    User(
        1,
        'فلفل',
        'https://www.pngplay.com/wp-content/uploads/10/Green-Pepper-Transparent-Image.png',
        "19 °س",
        "الرملية الخفيفة",
        "اّب - تشرين الأول",
        "6 - 14 يوم"),
    // User(2,'Apple',  'https://1.bp.blogspot.com/-YVELVCjND2w/UwipnL3CVZI/AAAAAAAAApM/HfgLEFprRKA/s1600/%D8%B5%D9%88%D8%B1%D8%A9+%D8%AA%D9%81%D8%A7%D8%AD%D8%A9+%D8%AD%D9%85%D8%B1%D8%A7%D8%A1+%D9%86%D8%A7%D8%B6%D8%AC%D8%A9+%D8%A8%D9%88%D8%B1%D9%82%D8%A9+%D8%AE%D8%B6%D8%B1%D8%A7%D8%A1+%D9%85%D9%81%D8%B1%D8%BA%D8%A9+%D8%B4%D9%81%D8%A7%D9%81%D8%A9+%D8%A7%D9%84%D8%AE%D9%84%D9%81%D9%8A%D8%A9+%D9%84%D9%84%D8%AA%D8%B5%D9%85%D9%8A%D9%85.png', "18-20 °C ", "Sandy","October - November" ,"11-12 Months"),
    User(
        3,
        'بطاطا',
        'https://cdn2.iconfinder.com/data/icons/food-drink-60/50/1F954-potato-512.png',
        "7-10 °س ",
        "الرملية",
        "تشرين الأول - كانون الأول",
        "100 يوم"),
    User(
        4,
        'بندورة',
        'https://cdn2.iconfinder.com/data/icons/food-drink-60/50/1F345-tomato-512.png',
        "15-20 °س ",
        "الطينية الثقيلة",
        "أيلول - تشرين الأول",
        "3-5 أشهر"),
    // User(5,'Kiwi',  'https://www.pngplay.com/wp-content/uploads/12/Cool-Kiwi-Juice-PNG-HD-Quality.png', "-8 °C ", "Soil Fertile","March - April","6 Months"),
    //  User(6,'Pear', 'https://creazilla-store.fra1.digitaloceanspaces.com/emojis/46851/pear-emoji-clipart-md.png', "-7 °C ", "Clay","January - mid-March","110 - 115 Days"),
    //  User(7,'Watermelon', 'https://www.pinclipart.com/picdir/big/557-5570134_cartoon-transparent-background-watermelon-clipart.png', "28 °C ","Light Sandy Soil","March - April","100 Day"),
    User(8, 'كوسا', 'https://cdn-icons-png.flaticon.com/512/1515/1515034.png',
        "21-35 °س ", "رطبة", "أذار - نيسان", "30-35 يوم"),
    //  User(9,'Grapes',  'https://www.pngplay.com/wp-content/uploads/10/Grape-Transparent-PNG.png', "22 °C ","Gravel Soil","February - April","6 Months"),
    User(
        10,
        'ملفوف',
        'https://www.i2clipart.com/cliparts/5/6/9/1/clipart-cabbage-512x512-5691.png',
        "24-26 °س ",
        "Fertile Soil",
        "اّب - أيلول",
        "2.5-3 أشهر"),
    User(
        1,
        'بازيلا',
        'https://www.pngall.com/wp-content/uploads/2/Pea-Transparent-PNG.png',
        "21 °س",
        "رملية ثقيلة",
        "أذار - نيسان",
        "60 - 90 أيام"),
    User(
        1,
        'الجزر',
        'https://www.pngarts.com/files/4/Carrot-Transparent-Background-PNG.png',
        "29-20 °س",
        "رملية",
        "أيلول - تشرين الأول",
        "2-4 أشهر"),
    User(
        1,
        'ليمون',
        'https://www.pngplay.com/wp-content/uploads/1/Lemon-Background-PNG.png',
        "28-10 °س",
        "الرملية والطينية",
        "أذار - اّب",
        "3 أشهر"),
  ];

  List<User> _foundedUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _foundedUsers = _users;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
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
        child: _foundedUsers.length > 0
            ? ListView.builder(
                itemCount: _foundedUsers.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: userComponent(user: _foundedUsers[index]),
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

  userComponent({required User user}) {
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
                  child: Image.network(user.image),
                )),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(user.name,
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
                if (user.index == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                user: user,
                              )));
                  // log("Index number is: ${user.image}");

                }
                if (user.index == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                user: user,
                              )));
                  // log("Index number is: ${user.image}");

                }
                if (user.index == 3) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                user: user,
                              )));
                  // log("Index number is: ${user.image}");

                }
                if (user.index == 4) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                user: user,
                              )));
                }
                if (user.index == 5) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                user: user,
                              )));
                }
                if (user.index == 6) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                user: user,
                              )));
                }
                if (user.index == 7) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                user: user,
                              )));
                }
                if (user.index == 8) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                user: user,
                              )));
                }
                if (user.index == 9) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                user: user,
                              )));
                }
                if (user.index == 10) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testitem(
                                user: user,
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
