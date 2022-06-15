import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:nb_utils/nb_utils.dart';

class Conditions extends StatefulWidget {
  List<String> listConditions;
  Conditions({Key? key, required this.listConditions}) : super(key: key);

  @override
  ConditionsState createState() => ConditionsState(this.listConditions);
}

class ConditionsState extends State<Conditions> {
  List<String> listConditions;
  ConditionsState(this.listConditions);

  // final String envConditions;
  // Card2(this.envConditions);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Padding(
        padding: EdgeInsets.all(10),
        // child: Card(

        //   clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(children: [
                      Image(
                        height: 58,
                        width: 50,
                        image: AssetImage('assets/icons/world.png'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "ظروف البيئة الملائمة",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ])),
                collapsed: Text(
                  listConditions[0],
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BulletedList(
                      style: TextStyle(color: black, fontSize: 15),
                      // bulletColor: Color.fromARGB(255, 42, 153, 140),
                      listItems: listConditions,
                      listOrder: ListOrder.ordered,
                    ),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
