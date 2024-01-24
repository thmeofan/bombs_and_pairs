import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../../app/consts/app_text_style/menu_style.dart';

class LevelButton extends StatelessWidget {
  final VoidCallback onTap;

  final String imagePath;
  final bool isSelected;
  final bool beenPlayedBomb;
  const LevelButton({
    Key? key,
    required this.onTap,
    required this.imagePath,
    required this.isSelected,
    required this.beenPlayedBomb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   final levelNumber = int.parse(text.replaceAll(RegExp(r'[^0-9]'), ''));
    //   final isOddLevel = levelNumber % 2 != 0;

    // final padding = isOddLevel
    //      ? EdgeInsets.only(
    //          top: MediaQuery.of(context).size.width * 0.05,
    //        )
    //      : EdgeInsets.only(
    //          bottom: MediaQuery.of(context).size.width * 0.05,
    //        );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.18,
        height: MediaQuery.of(context).size.width * 0.28,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.contain,
          ),
        ),
        // child: Center(
        //   child: Padding(
        //     padding: padding,
        //   ),
        // ),
      ),
    );
  }
}
