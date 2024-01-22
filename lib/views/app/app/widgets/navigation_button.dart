import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton(
      {Key? key,
      required this.assetName,
      required this.onTap,
      required this.buttonWidth,
      required this.buttonHeight})
      : super(key: key);
  final String assetName;
  final Function() onTap;
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
          child: Image(
            image: AssetImage(assetName),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
