import 'package:flutter/material.dart'; 
import 'package:line_icons/line_icons.dart';
import 'package:wallet_projet/theme/appColors/appColors.dart';

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({super.key,required this.onChanged});

  Function(int) onChanged;

  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
        titre: "Accueil", icon: LineIcons.home, index: 0, isSelected: true),
    BottomMenuModel(
      titre: "Explorer",
      icon: LineIcons.fileAlt,
      index: 1,
    ),
    BottomMenuModel(
      titre: "Formation",
      icon: LineIcons.bell,
      index: 2,
    ),
    BottomMenuModel(
      titre: "Chats",
      icon: Icons.auto_awesome_mosaic_outlined,
      index: 3,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      shape: const CircularNotchedRectangle(),
      color: AppColors.deepBlue,
      surfaceTintColor: AppColors.deepBlue.withOpacity(0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomMenuList
            .map(
              (e) => bottomBarIcon(item: e),
            )
            .toList(),
      ),
    );
  }

  Widget bottomBarIcon({required BottomMenuModel item}) => GestureDetector(
        onTap: () {
          for (var element in bottomMenuList) {
            element.isSelected = false;
          }
          item.isSelected = true;
          widget.onChanged.call(item.index);
          setState(() {});
        },
        behavior: HitTestBehavior.translucent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              item.icon,
              color: item.isSelected ? Colors.white : Colors.white54,
              size: 30,
            ),
          ],
        ),
      );
}

class BottomMenuModel {
  BottomMenuModel({
    required this.titre,
    required this.icon,
    required this.index,
    this.isSelected = false,
  });

  String titre;
  IconData icon;

  int index;

  bool isSelected;
}
