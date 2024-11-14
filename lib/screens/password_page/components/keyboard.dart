import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef KeyboardTapCallback = void Function(String text);

@immutable
class KeyboardUIConfig {
  //Digits have a round thin borders, [digitBorderWidth] define their thickness
  final double digitBorderWidth;
  final TextStyle digitTextStyle;
  final TextStyle deleteButtonTextStyle;
  final Color primaryColor;
  final Color digitFillColor;
  final EdgeInsetsGeometry keyboardRowMargin;
  final EdgeInsetsGeometry digitInnerMargin;

  //Size for the keyboard can be define and provided from the app.
  //If it will not be provided the size will be adjusted to a screen size.
  final Size? keyboardSize;

  const KeyboardUIConfig({
    this.digitBorderWidth = 1,
    this.keyboardRowMargin = const EdgeInsets.only(top: 15, left: 4, right: 4),
    this.digitInnerMargin = const EdgeInsets.all(24),
    this.primaryColor = Colors.white,
    this.digitFillColor = Colors.transparent,
    this.digitTextStyle = const TextStyle(fontSize: 30, fontFamily: "Aller"),
    this.deleteButtonTextStyle =
        const TextStyle(fontSize: 16, color: Colors.white),
    this.keyboardSize,
  });
}

class Keyboard extends StatelessWidget {
  final KeyboardUIConfig keyboardUIConfig;
  final KeyboardTapCallback onKeyboardTap;
  final _focusNode = FocusNode();
  static String deleteButton = 'keyboard_delete_button';
 

  Keyboard({
    Key? key,
    required this.keyboardUIConfig,
    required this.onKeyboardTap, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => _buildKeyboard(context);

  List<String> keyboardItemsTextes = [
    '',
    'ABC',
    'DEF',
    'GHI',
    'JKL',
    'MNO',
    'PQRS',
    'TUV',
    'WXYZ',
    '',
    ''
  ];

  Widget _buildKeyboard(BuildContext context) {
    List<String> keyboardItems =   [
        '1',
        '2',
        '3',
        '4',
        '5',
        '6',
        '7',
        '8',
        '9',
        '0',
        deleteButton
      ];
    
    final screenSize = MediaQuery.of(context).size;
    final keyboardHeight = //screenSize.height > screenSize.width
        screenSize.height * 0.3;
    final keyboardWidth = screenSize.width * 0.9; //keyboardHeight * 3.5 / 4;
    final keyboardSize = this.keyboardUIConfig.keyboardSize != null
        ? this.keyboardUIConfig.keyboardSize!
        : Size(keyboardWidth, keyboardHeight);
    return Container(
      width: keyboardSize.width,
      height: keyboardSize.height,
      //margin: EdgeInsets.only(top: 5),
      child: RawKeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKey: (event) {
          if (event is RawKeyUpEvent) {
            if (keyboardItems.contains(event.data.keyLabel)) {
              onKeyboardTap(event.logicalKey.keyLabel);
              return;
            }
            if (event.logicalKey.keyLabel == 'Backspace' ||
                event.logicalKey.keyLabel == 'Delete') {
              onKeyboardTap(Keyboard.deleteButton);
              return;
            }
          }
        },
        child: AlignedGrid(
          keyboardSize: keyboardSize,
          children: List.generate(11, (index) {
            return _buildKeyboardDigit(
                keyboardItems[index], keyboardItemsTextes[index]);
          }),
        ),
      ),
    );
  }

  Widget _buildKeyboardDigit(String number, String text) {
    return Container(
      // margin: EdgeInsets.all(2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.blue.shade100.withOpacity(0.5),
          onTap: () {
            onKeyboardTap(number);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                  color: keyboardUIConfig.primaryColor,
                  width: keyboardUIConfig.digitBorderWidth),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: keyboardUIConfig.digitFillColor,
              ),
              child: number == deleteButton
                  ? Icon(
                      Icons.keyboard_backspace,
                      color: keyboardUIConfig.digitTextStyle.color,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          number,
                          style: keyboardUIConfig.digitTextStyle,
                          semanticsLabel: number,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          text,
                          style: TextStyle(
                              fontSize: 15,
                              color: keyboardUIConfig.digitTextStyle.color,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Aller"),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class AlignedGrid extends StatelessWidget {
  final double runSpacing = 2;
  final double spacing = 6;
  final int listSize;
  final columns = 3;
  final List<Widget> children;
  final Size keyboardSize;

  const AlignedGrid(
      {Key? key, required this.children, required this.keyboardSize})
      : listSize = children.length,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final primarySize = keyboardSize.width > keyboardSize.height
        ? keyboardSize.height
        : keyboardSize.width;
    final itemSize = (primarySize - runSpacing * (columns - 1)) / columns;
    return Center(
      child: Wrap(
        runSpacing: runSpacing,
        spacing: spacing,
        alignment: WrapAlignment.end,
        children: children
            .map((item) => Container(
                  width: itemSize + 5,
                  height: itemSize,
                  child: item,
                ))
            .toList(growable: false),
      ),
    );
  }
}
