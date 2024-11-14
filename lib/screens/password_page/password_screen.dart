import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallet_projet/screens/home/home_screen.dart';
import 'package:wallet_projet/theme/appColors/appColors.dart';

import 'components/circle.dart';
import 'components/keyboard.dart';
import 'components/shake_curve.dart';

typedef PasswordEnteredCallback = void Function(String text);
typedef IsValidCallback = void Function();
typedef CancelCallback = void Function();

class SetPassWordScreen extends StatefulWidget {
  const SetPassWordScreen({super.key});

  @override
  State<SetPassWordScreen> createState() => _SetPassWordScreenState();
}

class _SetPassWordScreenState extends State<SetPassWordScreen>
    with SingleTickerProviderStateMixin {
  String enteredPasscode = '';
  late AnimationController controller;
  late Animation<double> animation;

  final int passwordDigits = 6;
  final String storedPasscode = '123456';

  KeyboardUIConfig keyboardUIConfig = KeyboardUIConfig(
      digitBorderWidth: 0.5,
      digitTextStyle: TextStyle(
          fontSize: 30, fontFamily: "Aller", color: Colors.blue.shade700),
      primaryColor: Colors.transparent,
      digitFillColor: Colors.transparent);

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    final Animation curve =
        CurvedAnimation(parent: controller, curve: ShakeCurve());
    animation = Tween(begin: 0.0, end: 10.0).animate(curve as Animation<double>)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            enteredPasscode = '';
            controller.value = 0;
          });
        }
      })
      ..addListener(() {
        setState(() {
          // the animation object’s value is the changed state
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(),
      body: SafeArea(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      surfaceTintColor: Colors.white,
                      padding: const EdgeInsets.all(5),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back, color: AppColors.blueColor3),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Mon identifiant",
                          style: TextStyle(
                              color: AppColors.blueColor3,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Aller"),
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(child: _buildPortraitPasscodeScreen())
      ])),

      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Aide /',
              style: TextStyle(
                  color: AppColors.blueColor3,
                  fontSize: 11,
                  fontFamily: "Aller"),
              recognizer: TapGestureRecognizer()..onTap = () {},
              children: [
                TextSpan(
                    text: ' Opposition / ',
                    style: TextStyle(
                      color: AppColors.blueColor3,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
                TextSpan(
                    text: ' Sécurité ',
                    style: TextStyle(
                      color: AppColors.blueColor3,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
              ]),
        ),
      ),
    );
  }

  _buildPortraitPasscodeScreen() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 247, 182, 182)),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "DL",
                  style: TextStyle(
                      color: Color.fromARGB(255, 146, 6, 6),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Text(
                "Diahara LANSRY",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.shade800,
                ),
              ),
            ),
            Text(
              'Mon mot de passe',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.blue.shade800,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Aller",
                  ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildCircles(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                //Handle button press event
                onPressed: () {
                  log(enteredPasscode);
                  _onPasscodeEntered(enteredPasscode);
                },
                //Contents of the button
                style: ElevatedButton.styleFrom(
                  //Change font size
                  elevation: 0,
                  backgroundColor: enteredPasscode.length == passwordDigits
                      ? Colors.blue.shade500
                      : Color(0xFFcdd6e5),
                  shadowColor: Colors.blueAccent.shade100,
                  textStyle: const TextStyle(
                    fontSize: 22,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  //Set the padding on all sides to 30px
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  minimumSize: Size(250, 50),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    " Je me connecte ",
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Aller",
                        fontSize: 17,
                        color: Colors.grey.shade50,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text(
                  "Mot de passe oublié ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decorationColor: Colors.blue.shade400,
                    color: Colors.blue.shade500,
                    height: 1.3,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Aller',
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Expanded(
              child: _buildKeyboard(),
            ),
            // _buildPasscodeRestoreButton(),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: _buildDeleteButton(),
            // ),
          ],
        ),
      );

  _buildKeyboard() => Container(
        child: Keyboard(
          onKeyboardTap: _onKeyboardButtonPressed,
          keyboardUIConfig: keyboardUIConfig,
        ),
      );

  List<Widget> _buildCircles() {
    var list = <Widget>[];
    var config = CircleUIConfig(
        borderColor: Colors.grey.shade300,
        fillColor: Colors.blue,
        borderWidth: 1.0,
        circleSize: 20);
    var extraSize = animation.value;
    for (int i = 0; i < passwordDigits; i++) {
      list.add(
        Container(
          margin: const EdgeInsets.all(3),
          child: Circle(
            filled: i < enteredPasscode.length,
            circleUIConfig: config,
            extraSize: extraSize,
          ),
        ),
      );
    }
    return list;
  }

  _onDeleteCancelButtonPressed() {
    if (enteredPasscode.isNotEmpty) {
      setState(() {
        enteredPasscode =
            enteredPasscode.substring(0, enteredPasscode.length - 1);
      });
    } else {
      print("############Canceled");
    }
  }

  _buildPasscodeRestoreButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
          child: TextButton(
            child: const Text(
              "Reset passcode",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            onPressed: () {},
            // splashColor: Colors.white.withOpacity(0.4),
            // highlightColor: Colors.white.withOpacity(0.2),
            // ),
          ),
        ),
      );

  _onKeyboardButtonPressed(String text) {
    log("$text");
    if (text == Keyboard.deleteButton) {
      _onDeleteCancelButtonPressed();
      return;
    }
    setState(() {
      if (enteredPasscode.length < passwordDigits) {
        enteredPasscode += text;

        //Verification automatique
        // if (enteredPasscode.length == passwordDigits) {
        //   _onPasscodeEntered(enteredPasscode);
        // }
      }
    });
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  // _showValidation(bool isValid) {
  //   if (isValid) {
  //     Navigator.maybePop(context).then((pop) => _validationCallback());
  //   } else {
  //     controller.forward();
  //   }
  // }

  // _validationCallback() {
  //   if (widget.isValidCallback != null) {
  //     widget.isValidCallback!();
  //   } else {
  //     print(
  //         "You didn't implement validation callback. Please handle a state by yourself then.");
  //   }
  // }

  Widget _buildDeleteButton() {
    return Container(
      child: CupertinoButton(
        onPressed: _onDeleteCancelButtonPressed,
        child: Container(
          margin: keyboardUIConfig.digitInnerMargin,
          child: enteredPasscode.isEmpty
              ? const Icon(
                  Icons.arrow_back,
                  color: Colors.blue,
                )
              : const Text(
                  'Delete',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  semanticsLabel: 'Delete',
                ),
        ),
      ),
    );
  }

  _onPasscodeEntered(String enteredPasscode) {
    bool isValid = storedPasscode == enteredPasscode;
    // _verificationNotifier.add(isValid);
    if (isValid) {
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomeScreen(),
        ),
      );
    }
  }
}
