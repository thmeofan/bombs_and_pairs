import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../consts/app_text_style/menu_style.dart';

class ChosenActionButton extends StatelessWidget {
  const ChosenActionButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/images/action_button_background.png';
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.1),
              StrokeText(
                strokeWidth: 4,
                strokeColor: Colors.black,
                text: text,
                textStyle: MenuTextStyle.lvlStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
