import 'package:flutter/material.dart';
import 'package:plants_talk/Agriculture_guide/user.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class testitem extends StatefulWidget {
  final User user;

  const testitem({Key? key, required this.user}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<testitem> {
  var selectedCard = 'WEIGHT';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ar', 'AE'), // English, no country code
          // Locale('es', ''), // Spanish, no country code
        ],
        title: "route",
        home: Scaffold(
            backgroundColor: Color(0xFF7A9BEE),
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  // Navigator.of(context).pop();
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
              ),
              backgroundColor: Colors.teal.shade700,
              elevation: 0.0,
              title: Text('تفاصيل',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18.0,
                      color: Colors.white)),
              centerTitle: true,
            ),
            body: ListView(children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height - 82.0,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.teal.shade700,
                ),
                Positioned(
                    top: 75.0,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45.0),
                              topRight: Radius.circular(45.0),
                            ),
                            color: Colors.white),
                        height: MediaQuery.of(context).size.height - 100.0,
                        width: MediaQuery.of(context).size.width)),
                Positioned(
                    top: 30.0,
                    left: (MediaQuery.of(context).size.width / 2) - 100.0,
                    child: Hero(
                        tag: widget.user,
                        child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(widget.user.image),
                                    fit: BoxFit.cover)),
                            height: 200.0,
                            width: 200.0))),
                Positioned(
                    top: 250.0,
                    left: 25.0,
                    right: 25.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.user.name,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 20.0),
                        SizedBox(height: 20.0),
                        Container(
                            height: 150.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                temperature('درجة الحرارة ',
                                    '${widget.user.temperature}'),
                                SizedBox(width: 5.0),
                                soilType('نوع التربة ', '${widget.user.Soil}'),
                                SizedBox(width: 20.0),

                                //    dates('hiii'),
                              ],
                            )),
                        SizedBox(height: 30.0),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Container(
                            height: 50.0,
                            child: Center(
                              child: Text(
                                  'وقت الزراعة: ${widget.user.planting_time}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Container(
                            height: 50.0,
                            child: Center(
                              child: Text(
                                  'يحتاج ${widget.user.Ripening_time} حتى ينضج',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  )),
                            ),
                          ),
                        )
                      ],
                    ))
              ])
            ])));
  }

  Widget temperature(String cardTitle, String info) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 900),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.teal.shade800,
              border: Border.all(
                  color: Colors.white, style: BorderStyle.solid, width: 0.75),
            ),
            height: 100.0,
            width: 180.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Center(
                      child: Text(cardTitle,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                        child: Image.asset(
                          'assets/images/temperature.png',
                          width: 40,
                          height: 40,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Text(info,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  )
                ])));
  }

//2
  Widget soilType(String cardTitle, String info) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 900),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.teal.shade800,
              border: Border.all(
                  color: Colors.white, style: BorderStyle.solid, width: 0.75),
            ),
            height: 100.0,
            width: 180.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Center(
                      child: Text(cardTitle,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                        child: Image.asset(
                          'assets/images/soil.png',
                          width: 40,
                          height: 40,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Text(info,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  )
                ])));
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
