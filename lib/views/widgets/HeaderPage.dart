import 'package:flutter/material.dart';

AppBar header(context,
    {bool isAppTitle = false,
    required String strTitle,
    diasppearedBackButton = false}) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    automaticallyImplyLeading: diasppearedBackButton ? false : true,
    title: Text(
      isAppTitle ? "PlantsTalk" : strTitle,
      style: TextStyle(
        color: Colors.greenAccent,
        fontFamily: isAppTitle ? "" : "",
        fontSize: isAppTitle ? 45.0 : 22.0,
      ),
      overflow: TextOverflow.ellipsis,
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}