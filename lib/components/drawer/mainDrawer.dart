import 'package:flutter/material.dart';
import 'package:wallet_projet/theme/appColors/appColors.dart';

class MainDrawerWidget extends StatefulWidget {
  MainDrawerWidget({
    super.key,
  });

  @override
  State<MainDrawerWidget> createState() => _MainDrawerWidgetState();
}

class _MainDrawerWidgetState extends State<MainDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Drawer(
        elevation: 0.5,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[],
        ),
      ),
    );
  }
}
