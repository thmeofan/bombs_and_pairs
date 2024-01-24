import 'package:bombs_and_pairs/views/app/app/widgets/chosen_action_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../../util/app_routes.dart';
import '../../app/widgets/heart_widget.dart';
import '../../app/widgets/navigation_button.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State createState() => _MenuScreenState();
}

class _MenuScreenState extends State {
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
                image: const AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.09,
            left: size.width * 0.01,
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.01,
                ),
                NavigationButton(
                  assetName: 'assets/images/settings.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.settingsScreen,
                    );
                  },
                  buttonHeight: size.width * 0.14,
                  buttonWidth: size.width * 0.07,
                ),
              ],
            ),
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: size.height * 0.8,
                  width: size.width * 0.65,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/toucan_flying.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.width * 0.25,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ChosenActionButton(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.pairProgress,
                          );
                        },
                        height: size.height * 0.3,
                        width: size.width * 0.3,
                        imagePath: 'assets/buttons/pairs.png',
                      ),
                      SizedBox(
                        width: size.width * 0.1,
                      ),
                      ChosenActionButton(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.bombProgress,
                          );
                        },
                        height: size.height * 0.3,
                        width: size.width * 0.3,
                        imagePath: 'assets/buttons/bomb.png',
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: size.height * 0.01,
                  right: size.width * 0.01,
                  child: const Column(
                    children: [
                      HeartWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
