import 'package:flutter/material.dart';

class IconMovingProgressIndicator extends StatelessWidget {
  final double progress;
  final Color backgroundColor;
  final Color valueColor;

  const IconMovingProgressIndicator({
    Key? key,
    required this.progress,
    required this.backgroundColor,
    required this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double iconSize = size.height * 0.1;
    double progressWidth = MediaQuery.of(context).size.width;

    double leftPosition = progress * (progressWidth - iconSize);

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: <Widget>[
        LinearProgressIndicator(
          value: progress,
          backgroundColor: backgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(valueColor),
        ),
        Positioned(
          left: leftPosition,
          bottom: -iconSize * 0.35,
          child: Image.asset(
            'assets/images/red_fire.png',
            width: iconSize,
            height: iconSize,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
