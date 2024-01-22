import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../../app/consts/app_colors.dart';
import '../../../app/consts/app_text_style/menu_style.dart';

class LevelButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String imagePath;
  final bool isSelected;
  final bool beenPlayed;

  const LevelButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.imagePath,
    required this.isSelected,
    required this.beenPlayed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.05,
            ),
            child: StrokeText(
              text: text,
              strokeWidth: 4,
              strokeColor: AppColors.redColor,
              textStyle: MenuTextStyle.lvlStyle,
            ),
          ),
        ),
      ),
    );
  }
}
