import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../data/repository/score_repo.dart';
import '../../../../util/app_routes.dart';
import '../../../app/app/widgets/heart_widget.dart';
import '../../../app/app/widgets/navigation_button.dart';
import '../../../app/consts/app_colors.dart';
import '../widget/game_card_widget.dart';

class BombLvlOne extends StatefulWidget {
  const BombLvlOne({super.key});

  @override
  _BombLvlOneState createState() => _BombLvlOneState();
}

class _BombLvlOneState extends State<BombLvlOne> {
  final String _bombIcon = 'bomb.png';
  List<String?> _gameIcons = [];
  List<bool> _cardFlipped = [];

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  void _initGame() {
    setState(() {
      _gameIcons = List<String?>.filled(4, null);
      _gameIcons[Random().nextInt(_gameIcons.length)] = _bombIcon;
      _cardFlipped = List<bool>.filled(_gameIcons.length, false);
    });
  }

  void _onCardClick(int index) {
    if (_cardFlipped[index]) return;

    setState(() {
      _cardFlipped[index] = true;
    });

    if (_gameIcons[index] == _bombIcon) {
      _endGame();
    }
  }

  void _endGame() async {
    await Future.delayed(Duration(milliseconds: 500));
    Navigator.of(context).pushNamed(AppRoutes.result);
    score += 15;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
        child: Stack(children: [
          Align(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.15,
                  left: size.width * 0.1,
                  right: size.width * 0.1,
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: size.width * 0.001,
                    mainAxisSpacing: size.width * 0.005,
                  ),
                  itemCount: _gameIcons.length,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      iconName: _gameIcons[index] ?? '',
                      isFlipped: _cardFlipped[index],
                      onTap: () => _onCardClick(index),
                    );
                  },
                ),
              ),
            ),
          ),
          // Positioned(
          //   top: size.height * 0.06,
          //   left: 0,
          //   right: 0,
          //   child: const Align(
          //     alignment: Alignment.center,
          //     child: BlinkingText(
          //       text: 'GO',
          //       strokeWidth: 4,
          //       strokeColor: AppColors.redColor,
          //       textStyle: SettingsTextStyle.heavyStyle,
          //     ),
          //   ),
          // ),
          Positioned(
            top: size.height * 0.1,
            left: size.width * 0.025,
            child: Row(
              children: [
                NavigationButton(
                  assetName: 'assets/images/home.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.home,
                    );
                  },
                  buttonHeight: size.width * 0.14,
                  buttonWidth: size.width * 0.07,
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
          Positioned(
            top: size.height * 0.1,
            right: size.width * 0.02,
            child: HeartWidget(),
          ),
        ]),
      ),
    );
  }
}
