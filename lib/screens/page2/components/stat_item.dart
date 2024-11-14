import 'package:flutter/material.dart';
import 'package:wallet_projet/theme/appColors/appColors.dart';
import 'package:wallet_projet/theme/appImages/appImages.dart';
import 'package:wallet_projet/theme/constant.dart';
import 'package:wallet_projet/widgets/customWidgets/CustomImageView.dart';

class statItem extends StatelessWidget {
  Statut statut;
  statItem({super.key, required this.statut});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      decoration: BoxDecoration(
          color: AppColors.blueColor2.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Lorem Ipsum",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Aller",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "dolor sit amet",
                style: TextStyle(
                  color: Colors.white24,
                  fontFamily: "Aller",
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: AppImages.icon_trend,
                height: 30,
                width: 30,
                color: getColor(statut),
                alignment: Alignment.center,
              ),
              Text(
                "+12.21",
                style: TextStyle(color: getColor(statut)),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "\$",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "6,942",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Aller",
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700),
              ),
            ],
          )
        ],
      ),
    );
  }
}
