import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String iconName;
  final bool isFlipped;
  final VoidCallback onTap;

  const CustomCard({
    super.key,
    required this.iconName,
    required this.isFlipped,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.2;
    double cardHeight = MediaQuery.of(context).size.width * 0.2;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: isFlipped
              ? const DecorationImage(
                  image: AssetImage('assets/images/card_face.png'),
                  fit: BoxFit.contain,
                )
              : const DecorationImage(
                  image: AssetImage('assets/images/card_back.png'),
                  fit: BoxFit.contain,
                ),
        ),
        child: Center(
          child: isFlipped && iconName.isNotEmpty
              ? Image.asset('assets/icons/$iconName')
              : null,
        ),
      ),
    );
  }
}
