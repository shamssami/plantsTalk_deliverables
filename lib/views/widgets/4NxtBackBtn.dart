import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

PageController myPageViewController = new PageController(viewportFraction: 0.8);

Widget buildNextbackBtn(double currentPage) => Container(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.00),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            currentPage != 0
                ? GestureDetector(
                    onTap: () {
                      myPageViewController.previousPage(
                          duration: Duration(seconds: 1), curve: Curves.ease);
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.navigate_before),
                          Text(
                            "رجوع",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
            GestureDetector(
              onTap: () {
                myPageViewController.nextPage(
                    duration: Duration(seconds: 1), curve: Curves.ease);
              },
              child: Container(
                child: Row(
                  children: [
                    Text(
                      "تخطى",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
