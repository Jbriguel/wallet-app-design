import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wallet_projet/components/drawer/mainDrawer.dart';
import 'package:wallet_projet/theme/appColors/appColors.dart';
import 'package:wallet_projet/theme/appImages/appImages.dart';
import 'package:wallet_projet/widgets/customWidgets/CustomImageView.dart';
import 'package:wallet_projet/widgets/customWidgets/customBottomBar.dart';

import '../page1/page1_screen.dart';
import '../page2/page2_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  // Create a key
  final PageController controller = PageController(initialPage: 0);

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: AppColors.deepBlue,
      appBar: AppBar(
        backgroundColor: AppColors.deepBlue,
        automaticallyImplyLeading: false,
        leadingWidth: 60,
        toolbarHeight: 80,
        surfaceTintColor: Colors.transparent,
        leading: InkWell(
          onTap: () => _key.currentState!.openDrawer(),
          child: CustomImageView(
            imagePath: AppImages.icon_menu,
            height: 30,
            width: 30,
            color: Colors.white,
            alignment: Alignment.center,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue.shade300,
                  Colors.blue.shade400,
                  Colors.blue.shade500,
                  Colors.blue.shade600,
                  Colors.blue.shade700,
                ]),
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: MainDrawerWidget(),
      drawerScrimColor: Colors.transparent,
      // body: Column(
      //   children: [LineChartCard()],
      // ),
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: CustomBottomAppBar(
            onChanged: (index) => setState(() => _currentIndex = index)),
      ),
    );
  }

  List<Widget> pages = [const Page1Screen(), const Page2Screen(), Container(), Container()];
}

/////////////////////////////////////////////////
///
