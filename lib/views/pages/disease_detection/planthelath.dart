import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:plants_talk/services/notification.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MySensorCard extends StatelessWidget {
  Widget slider = SleekCircularSlider(
    appearance: CircularSliderAppearance(),
    initialValue: 25,
    onChange: (double value) {
      print(value);
    },
  );

  Widget slider1 = SleekCircularSlider(
    appearance: CircularSliderAppearance(
      customColors: CustomSliderColors(
          trackColor: Colors.limeAccent,
          progressBarColors: [Colors.lightGreen, Colors.amberAccent],
          shadowMaxOpacity: 20.0),
      infoProperties: InfoProperties(topLabelText: 'Running..'),
    ),
    initialValue: 60,
    onChange: (double value) {
      print(value);
    },
  );

  MySensorCard(
      {Key? key,
      required this.value,
      required this.name,
      required this.assetImage,
      required this.unit,
      // required this.trendData,
      required this.linePoint,
      List<double>? trendData})
      : super(key: key);

  final String value;
  final String name;
  final String unit;
  final Color linePoint;
  final AssetImage assetImage;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        shadowColor: Colors.white,
        elevation: 24,
        color: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 200,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      width: 60,
                      image: assetImage,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(name, style: TextStyle(color: Colors.black)),
                    SizedBox(
                      height: 10,
                    ),
                    Text('$value$unit', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),

              Expanded(
                flex: 1,
                child: SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(
                      minimum: 0,
                      maximum: 100,
                      showLabels: false,
                      showTicks: false,
                      radiusFactor: 0.8,
                      axisLineStyle: const AxisLineStyle(
                          cornerStyle: CornerStyle.bothCurve,
                          color: Colors.black12,
                          thickness: 12),
                      pointers: <GaugePointer>[
                        RangePointer(
                            value: double.parse('$value'),
                            cornerStyle: CornerStyle.bothCurve,
                            width: 18,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                            gradient: SweepGradient(colors: <Color>[
                              Color.fromARGB(255, 31, 132, 163),
                              Color.fromARGB(255, 165, 6, 33)
                            ], stops: <double>[
                              0.25,
                              0.75
                            ])),
                        MarkerPointer(
                            value: double.parse('$value'),
                            enableDragging: true,
                            onValueChanged: (double n) {
                              n = 50;
                            },
                            markerHeight: 34,
                            markerWidth: 34,
                            markerType: MarkerType.circle,
                            color: Color.fromARGB(255, 165, 6, 33),
                            borderWidth: 2,
                            borderColor: Colors.white54)
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            angle: 90,
                            axisValue: 5,
                            positionFactor: 0.2,
                            widget: Text('$value'.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFCC2B5E))))
                      ])
                ]),
              )
              // Expanded(child: slider1)
            ],
          ),
        ));
  }
}
