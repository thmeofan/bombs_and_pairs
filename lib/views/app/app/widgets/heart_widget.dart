import 'package:flutter/material.dart';

import '../../../../data/repository/score_repo.dart';

class HeartWidget extends StatelessWidget {
  const HeartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    List<Widget> hearts = List.generate(3, (index) {
      if (index < (life + 1) ~/ 2) {
        return Image.asset(
          'assets/icons/heart.png',
          height: screenWidth * 0.05,
        );
      } else {
        return Image.asset('assets/icons/heart.png');
      }
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: hearts,
    );
  }
}
