import 'package:flutter/material.dart';

class PairLevelButton extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final bool isSelected;
  final bool beenPlayedPair;

  const PairLevelButton({
    Key? key,
    required this.onTap,
    required this.imagePath,
    required this.isSelected,
    required this.beenPlayedPair,
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
      ),
    );
  }
}
