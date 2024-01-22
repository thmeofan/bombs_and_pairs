import 'package:flutter/material.dart';

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
  final double? width; // Optional width parameter
  final double? height; // Optional height parameter

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/images/action_button_background.png';

    return Padding(
      padding:
          const EdgeInsets.all(10), // You can change this to suit your needs
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), // Border radius
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.contain,
          ),
        ),
        child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            // primary: Colors.transparent,
          ),
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
