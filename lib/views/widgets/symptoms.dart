import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:nb_utils/nb_utils.dart';

class Symptoms extends StatefulWidget {
  List<String> fruitSymptoms;
  List<String> leafSymptoms;
  Symptoms(this.fruitSymptoms, this.leafSymptoms, {Key? key}) : super(key: key);

  @override
  SymptomsState createState() =>
      SymptomsState(this.fruitSymptoms, this.leafSymptoms);
}

class SymptomsState extends State<Symptoms> {
  List<String> fruitSymptoms;
  List<String> leafSymptoms;

  SymptomsState(this.fruitSymptoms, this.leafSymptoms);

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
                        image: AssetImage('assets/icons/symptoms.png'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "الأعراض",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ])),
                collapsed: Text(
                  fruitSymptoms[0],
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'أعراض الفاكهة',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                    BulletedList(
                      style: TextStyle(color: black, fontSize: 15),
                      // bulletColor: Color.fromARGB(255, 42, 153, 140),
                      listItems: fruitSymptoms,
                      listOrder: ListOrder.ordered,
                    ),
                    Text(
                      'أعراض الأوراق',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                    BulletedList(
                      style: TextStyle(color: black, fontSize: 15),
                      // bulletColor: Color.fromARGB(255, 42, 153, 140),
                      listItems: leafSymptoms,
                      // listOrder: ListOrder.ordered,
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
