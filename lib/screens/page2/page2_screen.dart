import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:wallet_projet/theme/appColors/appColors.dart';
import 'package:wallet_projet/theme/constant.dart';
import 'package:wallet_projet/widgets/customTabs.dart';

import 'components/stat_item.dart';

class Page2Screen extends StatefulWidget {
  const Page2Screen({super.key});

  @override
  State<Page2Screen> createState() => _Page2ScreenState();
}

class _Page2ScreenState extends State<Page2Screen> {
  Widget _getRadialGauge() {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
            positionFactor: 0.1,
            angle: 90,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "72 %",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.white,
                        fontFamily: "Aller",
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Text(
                    "lorem ipsum ,dolor sit amet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontFamily: "Aller",
                    ),
                  ),
                )
              ],
            ),
          )
        ],
        minimum: 0,
        maximum: 100,
        endAngle: 270,
        startAngle: 270,
        showTicks: false,
        showLabels: false,
        pointers: <GaugePointer>[
          RangePointer(
              value: 72,
              width: 0.1,
              sizeUnit: GaugeSizeUnit.factor,
              cornerStyle: CornerStyle.startCurve,
              gradient: SweepGradient(colors: <Color>[
                Colors.blue.shade200,
                Colors.blue.shade500,
              ], stops: const <double>[
                0.25,
                0.75
              ])),
          const MarkerPointer(
            markerHeight: 20,
            markerWidth: 20,
            value: 72,
            markerType: MarkerType.circle,
            color: Colors.white,
          )
        ],
        axisLineStyle: AxisLineStyle(
          thickness: 0.05,
          color: Colors.grey.shade50.withOpacity(0.1),
          thicknessUnit: GaugeSizeUnit.factor,
          cornerStyle: CornerStyle.startCurve,
        ),
      )
    ]);
  }

  Widget _getLinearGauge() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: const LinearTickStyle(length: 20),
          axisLabelStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
          axisTrackStyle: const LinearAxisTrackStyle(
              color: Colors.cyan,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
    );
  }

  ///////////
  final _selectedSegment = ValueNotifier('lorem');

  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Align(
      alignment: Alignment.center,
      child: Column(children: [
        const Text(
          "SUMMARIES",
          style: TextStyle(
              fontFamily: "Aller",
              color: Colors.white,
              letterSpacing: 4,
              fontWeight: FontWeight.w900,
              fontSize: 25),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: AdvancedSegment(
            controller: _selectedSegment,
            backgroundColor: Colors.blue.shade100.withOpacity(0.2),
            sliderColor: Colors.white.withOpacity(0.2),
            activeStyle:
                const TextStyle(color: Colors.white, fontFamily: "Aller"),
            inactiveStyle: TextStyle(
                color: Colors.white.withOpacity(0.5), fontFamily: "Aller"),
            segments: const {
              'lorem': 'lorem',
              'ipsum': 'ipsum',
              'dolor': 'dolor',
            },
          ),
        ),
        Expanded(
          child: ValueListenableBuilder<String>(
            valueListenable: _selectedSegment,
            builder: (_, key, __) {
              if (_selectedSegment.value == "lorem") {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox.square(
                          dimension: 200, child: _getRadialGauge()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: Stack(children: [
                            ListView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => statItem(
                                statut:
                                    index % 2 == 0 ? Statut.UP : Statut.DOWN,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 20,
                                decoration: BoxDecoration(
                                  color: AppColors.deepBlue,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        AppColors.deepBlue.withOpacity(0.1),
                                        AppColors.deepBlue.withOpacity(0.5),
                                        AppColors.deepBlue,
                                      ]),
                                ),
                              ),
                            ),
                          ])),
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ]),
    ));
  }
}
