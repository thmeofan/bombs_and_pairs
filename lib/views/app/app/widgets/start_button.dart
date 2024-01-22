import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton(
      {Key? key,
      required this.onTap,
      required this.assetName,
      required this.buttonWidth,
      required this.buttonHeight})
      : super(key: key);
  final Function() onTap;
  final String assetName;
  final double buttonWidth;
  final double buttonHeight;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(assetName),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
