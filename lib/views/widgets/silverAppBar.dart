import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget(
      {Key? key,
      required this.value,
      required this.image_path,
      required this.caption})
      : super(key: key);

  final String value;
  final String image_path;
  final String caption;

  @override
  Widget build(BuildContext context) {
    print('--' + value + '--');
    return Container(
      height: 600,
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 50, top: 40),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          Text(
                            '$value',
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                ?.copyWith(
                                    color: Colors.white,
                                    fontFamily: 'flutterfonts'),
                          ),
                          Text(
                            this.caption,
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'flutterfonts',
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20, top: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(image_path),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
