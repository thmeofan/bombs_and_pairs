import 'package:flutter/material.dart';

import '../../../../data/repository/score_repo.dart';
import '../../../../util/app_routes.dart';
import '../../../app/app/widgets/heart_widget.dart';
import '../../../app/app/widgets/navigation_button.dart';
import '../../../app/consts/app_colors.dart';

import '../widget/game_card_widget.dart';

class PairLvlTwo extends StatefulWidget {
  const PairLvlTwo({super.key});

  @override
  _PairLvlTwoState createState() => _PairLvlTwoState();
}

class _PairLvlTwoState extends State<PairLvlTwo> {
  final List<String> _availableIcons = [
    'bomb.png',
    'cave.png',
    'lianas.png',
    'nuts.png',
    'rock.png',
    'volcano.png',
  ];

  List<String> _gameIcons = [];
  List<bool> _cardFlipped = [];
  int _previousIndex = -1;
  bool _flipAllowed = true;

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  void _initGame() {
    setState(() {
      List<String> halfGameIcons = List<String>.from(_availableIcons)
        ..shuffle();
      halfGameIcons = halfGameIcons.take(3).toList();

      _gameIcons = [...halfGameIcons, ...halfGameIcons];
      _gameIcons.shuffle();

      _cardFlipped = List<bool>.filled(_gameIcons.length, false);
      _previousIndex = -1;
    });
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
                  top: size.height * 0.2,
                  left: size.width * 0.1,
                  right: size.width * 0.08,
                  bottom: size.height * 0.05,
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2,
                    crossAxisSpacing: size.width * 0.026,
                    mainAxisSpacing: size.width * 0.006,
                  ),
                  itemCount: _gameIcons.length,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      iconName: _gameIcons[index],
                      isFlipped: _cardFlipped[index],
                      onTap: () => _onCardClick(index),
                    );
                  },
                ),
              ),
            ),
          ),
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

  void _onCardClick(int index) {
    if (!_flipAllowed || _cardFlipped[index]) return;

    setState(() {
      _cardFlipped[index] = true;
    });

    if (_previousIndex == -1) {
      _previousIndex = index;
    } else {
      if (_gameIcons[index] == _gameIcons[_previousIndex]) {
        _checkForCompletion();
        _previousIndex = -1;
      } else {
        _flipAllowed = false;
        Future.delayed(const Duration(milliseconds: 700), () {
          setState(() {
            _cardFlipped[index] = false;
            _cardFlipped[_previousIndex] = false;
            _previousIndex = -1;
            _flipAllowed = true;
          });
        });
      }
    }
  }

  void _checkForCompletion() {
    if (_cardFlipped.every((bool status) => status)) {
      Navigator.of(context).pushNamed(
        AppRoutes.result,
      );
      score += 100;
    }
  }
}
