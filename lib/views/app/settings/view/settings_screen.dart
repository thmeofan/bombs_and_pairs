import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../../../util/app_routes.dart';
import '../../app/view/my_in_app_web_view.dart';
import '../../app/widgets/heart_widget.dart';
import '../../app/widgets/navigation_button.dart';
import '../../consts/app_colors.dart';
import '../../consts/app_text_style/settings_style.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
            top: size.height * 0.1,
            left: size.width * 0.025,
            child: NavigationButton(
              assetName: 'assets/icons/home.png',
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.home,
                );
              },
              buttonHeight: size.width * 0.13,
              buttonWidth: size.width * 0.05,
            ),
          ),
          Positioned(
            top: size.height * 0.1,
            right: size.width * 0.02,
            child: HeartWidget(),
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
                  bottom: (size.height * 0.15),
                  right: (size.width * 0.035),
                  child: Image.asset(
                    'assets/images/explosion.png',
                    height: size.height * 0.4,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: (size.height * 0.12),
                  left: (size.width * 0.03),
                  child: Image.asset(
                    'assets/images/explosion.png',
                    height: size.height * 0.4,
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      child: StrokeText(
                        strokeWidth: 4,
                        strokeColor: AppColors.redColor,
                        textStyle: SettingsTextStyle.heavyTextStyle,
                        text: 'PRIVACY POLICY',
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyInAppWebView(
                                url: 'https://google.com/'),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextButton(
                      child: StrokeText(
                        strokeWidth: 4,
                        strokeColor: AppColors.redColor,
                        textStyle: SettingsTextStyle.heavyTextStyle,
                        text: 'TERMS OF USE',
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyInAppWebView(
                                url: 'https://google.com/'),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextButton(
                      child: StrokeText(
                        strokeWidth: 4,
                        strokeColor: AppColors.redColor,
                        textStyle: SettingsTextStyle.heavyTextStyle,
                        text: 'RATE APP',
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyInAppWebView(
                                url: 'https://google.com/'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
