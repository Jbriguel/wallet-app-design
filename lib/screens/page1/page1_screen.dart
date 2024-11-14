import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wallet_projet/components/button/UnicornOutlineButton.dart';
import 'package:wallet_projet/theme/constant.dart';

import 'components/data_status.dart';
import 'components/line_chart_sample2.dart';
import 'components/stats_card.dart';

class Page1Screen extends StatefulWidget {
  const Page1Screen({super.key});

  @override
  State<Page1Screen> createState() => _Page1ScreenState();
}

class _Page1ScreenState extends State<Page1Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "hi, Julien !",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontFamily: "Aller",
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                "lorem ipsum ,dolor sit amet",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontFamily: "Aller",
                ),
              ),
              const DataStatus(),
              const SizedBox(
                height: 10,
              ),
              const LineChartSample2(),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                UnicornOutlineButton(
                  strokeWidth: 0,
                  radius: 10,
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.cyan.shade400],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  minHeight: 32,
                  backgroundColor: Colors.white24,
                  child: Text('Ipsum',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontFamily: "Aller",
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  //Handle button press event
                  onTap: () {},
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.blue.shade300,
                        Colors.blue.shade400,
                        Colors.blue.shade500,
                        Colors.blue.shade600,
                        Colors.blue.shade700,
                      ]),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        " Lorem ipsum ",
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Aller",
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: statsCard(
                      title: "INCOME",
                      value: "+69.42",
                      amount: "249.25",
                      statut: Statut.UP,
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: statsCard(
                      title: "OUTCOME",
                      value: "-694.2",
                      amount: "65.25",
                      statut: Statut.DOWN,
                    )),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}


