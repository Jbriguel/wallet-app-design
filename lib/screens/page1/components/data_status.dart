import 'package:flutter/material.dart';

class DataStatus extends StatelessWidget {
  const DataStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "\$",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                Text(
                  "69,420",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.white,
                      fontFamily: "Aller",
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.all(5),
              width: 80,
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Text(
                      "+ 6,942 ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.blue.shade200,
                        Colors.blue.shade400,
                        Colors.blue.shade500,
                        Colors.blue.shade400,
                        Colors.blue.shade500,
                      ]),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
