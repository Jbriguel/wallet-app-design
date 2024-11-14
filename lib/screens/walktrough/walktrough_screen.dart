import 'package:flutter/material.dart';
import 'package:wallet_projet/screens/password_page/password_screen.dart';
import 'package:wallet_projet/screens/walktrough/components/content.dart';
import 'package:wallet_projet/theme/appColors/appColors.dart';
import 'package:wallet_projet/theme/appImages/appImages.dart';
import 'package:wallet_projet/theme/constant.dart';

class WalktroughScreen extends StatefulWidget {
  const WalktroughScreen({super.key});

  @override
  State<WalktroughScreen> createState() => _WalktroughScreenState();
}

class _WalktroughScreenState extends State<WalktroughScreen> {
  int currentPage = 0;
  PageController controller = PageController();

  void onPressed() {
    if (currentPage < 2) {
      controller.animateToPage(currentPage + 1,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SetPassWordScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.background_1),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: (MediaQuery.of(context).size.height * 0.45),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.deepBlue,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.deepBlue.withOpacity(0.1),
                      AppColors.deepBlue,
                      AppColors.deepBlue,
                      AppColors.deepBlue,
                      AppColors.deepBlue,
                    ]),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: contentsData.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Content(
                        contentData: contentsData[index],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 25, left: 5, right: 5),
                      child: bottomWidget(),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]
            /* bottomNavigationBar: SizedBox(
              height: 100,
              child: bottomWidget(),
            ),*/
            ),
      ),
    );
  }

  /*
PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: contentsData.length,
                    itemBuilder: (context, index) => Content(
                      contentData: contentsData[index],
                    ),
                  ),
  */

  Padding bottomWidget() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _buildPageIndicator(),
          GestureDetector(
            //Handle button press event
            onTap: () => onPressed(),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  currentPage != 2 ? " Next " : " Get Started ",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: "Aller",
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        ]),
      );

  Padding _buildPageIndicator() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            contentsData.length,
            (index) => buildDot(index: index),
          ),
        ),
      );

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 5,
      width: currentPage == index ? 18 : 15,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blue.shade300 : Colors.white10,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
