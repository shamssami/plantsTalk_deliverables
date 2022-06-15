import 'package:flutter/material.dart';
import 'package:plants_talk/responsive/mobile_screen_layout.dart';
import 'package:plants_talk/responsive/responsive_layout.dart';
import 'package:plants_talk/responsive/web_screen_layout.dart';
import 'package:plants_talk/screens/guidePage.dart';

import '../screens/real_time_monitoring/monitor2.dart';

class CustomAppBarItem {
  IconData icon;
  bool hasNotification;

  CustomAppBarItem({required this.icon, this.hasNotification = false});
}

class CustomBottomAppBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;
  final List<CustomAppBarItem> items;
  List<Widget> tabs = [
    guide(),
    ResponsiveLayout(
      mobileScreenLayout: MobileScreenLayout(),
      webScreenLayout: WebScreenLayout(),
    ),
    //HomePage(),
  ];

  CustomBottomAppBar({required this.onTabSelected, required this.items}) {
    assert(this.items.length == 2 || this.items.length == 3);
  }

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedIndex = 0;

  void _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabIcon(
          index: index, item: widget.items[index], onPressed: _updateIndex);
    });
    items.insert(items.length >> 1, _buildMiddleSeparator());
    List<Widget> tabs = [
      guide(),
      ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
      Monitor2()
    ];
    int currentTabIndex = 0;
    onTapped(int index) {
      setState(() {
        currentTabIndex = index;
      });
    }

    return Scaffold(
        body: tabs[currentTabIndex],
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 60.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items,
            ),
          ),
          shape: CircularNotchedRectangle(),
        ));
  }

  Widget _buildMiddleSeparator() {
    return Expanded(
      child: SizedBox(
        height: 60.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabIcon(
      {required int index,
      required CustomAppBarItem item,
      required ValueChanged<int> onPressed}) {
    return Expanded(
      child: SizedBox(
        height: 60.0,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: item.hasNotification
                ? Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Icon(
                        item.icon,
                        color: _selectedIndex == index
                            ? Color.fromARGB(255, 41, 212, 76)
                            : Colors.black,
                        size: 24.0,
                      ),
                      Positioned(
                        top: 16.0,
                        right: 22.0,
                        child: Icon(
                          Icons.brightness_1,
                          color: Color(0xffC5002D),
                          size: 10.0,
                        ),
                      )
                    ],
                  )
                : Icon(
                    item.icon,
                    color: _selectedIndex == index
                        ? Color.fromARGB(255, 41, 212, 76)
                        : Colors.black,
                    size: 24.0,
                  ),
          ),
        ),
      ),
    );
  }
}
