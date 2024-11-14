import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wallet_projet/theme/constant.dart';

class statsCard extends StatelessWidget {
  statsCard({
    super.key,
    required this.title,
    required this.value,
    required this.amount,
    required this.statut,
  });

  String title;
  String value;
  String amount;
  Statut statut;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: "Aller",
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w300),
                ),
              ),
              Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Aller",
                    color: getColor(statut),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "\$",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    AutoSizeText(
                      amount,
                      minFontSize: 13,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: "Aller",
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Icon(
                statut == Statut.UP
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down,
                size: 50,
                color: getColor(statut),
              )
            ],
          )),
        ],
      ),
    );
  }
}
