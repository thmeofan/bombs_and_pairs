import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class BlinkingText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Color strokeColor;
  final double strokeWidth;

  const BlinkingText({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.strokeColor,
    required this.strokeWidth,
  }) : super(key: key);

  @override
  _BlinkingTextState createState() => _BlinkingTextState();
}

class _BlinkingTextState extends State<BlinkingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.4).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: StrokeText(
            text: widget.text,
            strokeWidth: widget.strokeWidth,
            strokeColor: widget.strokeColor,
            textStyle: widget.textStyle,
          ),
        );
      },
    );
  }
}
