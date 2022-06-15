import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Monitor2 extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Monitor2> {
  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 130, horizontal: 20),
          child: Text(
            ' ',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            '   ',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEmailRow() {
    return Column(children: <Widget>[
      Row(
        children: [
          Expanded(
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          Expanded(
              child: Text(
            'درجة الحرارة',
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
          Expanded(
            child: SvgPicture.asset("assets/icons/sun.svg"),
          ),
        ],
      )
    ]);
    // ]
  }

  ///
  Widget _buildEmailRow1() {
    return Column(children: <Widget>[
      Row(
        children: [
          Expanded(
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          Expanded(
              child: Text(
            'tempreture',
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
          Expanded(
            child: SvgPicture.asset("assets/icons/icon_3.svg"),
          ),
        ],
      )
    ]);
    // ]
  }

  //
  Widget _buildEmailRow2() {
    return Column(children: <Widget>[
      Row(
        children: [
          Expanded(
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          Expanded(
              child: Text(
            'رطوبة التربة',
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
          Expanded(
            child: SvgPicture.asset('assets/images/soil-moisture.png'),
          ),
        ],
      )
    ]);
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: 250,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildEmailRow(),
                _buildEmailRow1(),
                _buildEmailRow2(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('مراقبة النبات'),
          backgroundColor: Color.fromARGB(255, 42, 153, 140),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Color(0xfff2f3f7),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/plant22.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 100,
              width: 300,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildLogo(),
                _buildContainer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
