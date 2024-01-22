import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../../../data/repository/score_repo.dart';
import '../../../../util/app_routes.dart';
import '../../../app/app/widgets/heart_widget.dart';
import '../../../app/app/widgets/navigation_button.dart';
import '../../../app/app/widgets/start_button.dart';
import '../../../app/consts/app_colors.dart';
import '../../../app/consts/app_text_style/menu_style.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  AppColors.darkRedColor.withOpacity(0.4),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.11,
            right: size.height * 0.22,
            child: Image.asset('assets/images/boom.png'),
            height: size.height * 0.8,
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: size.height * 0.8,
                  width: size.width * 0.6,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.11,
                  child: Image.asset('assets/images/explosion.png'),
                  height: size.height * 0.75,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StrokeText(
                      strokeWidth: 4,
                      strokeColor: AppColors.redColor,
                      text: 'The level is Over!',
                      textStyle: MenuTextStyle.category,
                    ),
                    StrokeText(
                      strokeWidth: 4,
                      strokeColor: AppColors.redColor,
                      text: '+ ${score.toString()}',
                      textStyle: MenuTextStyle.category,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.1,
            left: size.width * 0.025,
            child: Row(
              children: [
                NavigationButton(
                  assetName: 'assets/icons/home.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.home,
                    );
                  },
                  buttonHeight: size.width * 0.13,
                  buttonWidth: size.width * 0.05,
                ),
                SizedBox(
                  width: size.height * 0.025,
                ),
                NavigationButton(
                  assetName: 'assets/icons/settings.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.settingsScreen,
                    );
                  },
                  buttonHeight: size.width * 0.13,
                  buttonWidth: size.width * 0.05,
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.1,
            right: size.width * 0.02,
            child: HeartWidget(),
          ),
          Positioned(
            bottom: 10,
            left: size.width * 0.025,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StartButton(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.home,
                    );
                  },
                  assetName: 'assets/images/next.png',
                  buttonWidth: size.width * 0.18,
                  buttonHeight: size.height * 0.24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
