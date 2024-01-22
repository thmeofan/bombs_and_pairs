import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LevelButton extends StatelessWidget {
  const LevelButton({
    Key? key,
    required this.assetName,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final String assetName;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonSize = screenWidth * 0.16;
    final selectedScale = 1.1;
    final unselectedScale = 1.0;

    return AnimatedContainer(
      width: buttonSize,
      height: buttonSize,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      transform: Matrix4.diagonal3Values(
        isSelected ? selectedScale : unselectedScale,
        isSelected ? selectedScale : unselectedScale,
        1.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: SvgPicture.asset(
            assetName,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
