import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallet_projet/screens/walktrough/walktrough_screen.dart';
import 'package:wallet_projet/theme/appImages/appImages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin { 

  @override
  void initState() {
    super.initState();
    
  }

  @override
  void dispose() { 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  Future.delayed(const Duration(seconds: 4), () {
   Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const WalktroughScreen(),
          ),
        );
});

    return Material(
      child: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.background_1),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "App Name",
                    style: TextStyle(
                        fontFamily: "Aller", color: Colors.white, fontSize: 30),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Center(
                  child: AutoSizeText(
                    "Slogan",
                    minFontSize: 15,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Aller',
                        fontSize: 18,
                        height: 2.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.0,
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Center(
                    child: Text(
                      "©2024 - We love coffee",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Aller',
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ])),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        )
      ]),
    );
  }
}
