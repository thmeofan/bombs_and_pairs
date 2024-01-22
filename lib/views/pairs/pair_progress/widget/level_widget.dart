import 'package:flutter/material.dart';

class LevelWidget extends StatelessWidget {
  const LevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.asset('assets/lvl_banner.png'),
        Positioned(
          bottom: 0,
          child: Image.asset('assets/grass.png'),
        ),
        Positioned(
          top: 0,
          child: Image.asset('assets/lvl_stars_empty.png'),
        ),
      ],
    );
  }
}
