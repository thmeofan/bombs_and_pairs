import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/repository/score_repo.dart';
import '../../../../util/app_routes.dart';
import '../../../app/app/widgets/heart_widget.dart';
import '../../../app/app/widgets/navigation_button.dart';
import '../../../app/consts/app_colors.dart';
import '../widget/level_button.dart';

class PairProgressScreen extends StatefulWidget {
  const PairProgressScreen({super.key});

  @override
  _PairProgressScreenState createState() => _PairProgressScreenState();
}

class _PairProgressScreenState extends State<PairProgressScreen> {
  final int numberOfLevels = 5;
  int selectedLevelIndex = 0;
  List<bool>? levelsPlayedBomb;

  _PairProgressScreenState() {
    levelsPlayedBomb = List.generate(5, (_) => false);
  }

  @override
  void initState() {
    super.initState();
    _loadPlayedLevelsBomb();
  }

  Future<void> _loadPlayedLevelsBomb() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      levelsPlayedBomb = List.generate(numberOfLevels,
          (index) => prefs.getBool('levelPlayedBomb$index') ?? false);
    });
  }

  Future<void> _savePlayedLevelBomb(int levelIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('levelPlayedBomb$levelIndex', true);
  }

  void _onStartLevel() {
    if (levelsPlayedBomb == null) {
      return;
    }
    if (life >= 1) {
      setState(() {
        levelsPlayedBomb![selectedLevelIndex] = true;
      });
      _savePlayedLevelBomb(selectedLevelIndex);
      life -= 1;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Sorry, you\'re out of lives',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.greenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          margin: EdgeInsets.symmetric(horizontal: 150),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
          ),
        ),
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.35,
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              LevelButton(
                isSelected: selectedLevelIndex == 0,
                onTap: () {
                  setState(() {
                    selectedLevelIndex = 0;
                    levelsPlayedBomb![0] = true;
                  });
                  _onStartLevel();
                  Navigator.of(context).pushNamed(AppRoutes.pairLvl1);
                },
                // text: 'LvL 1',
                beenPlayedBomb:
                    levelsPlayedBomb != null && levelsPlayedBomb![0],
                imagePath: levelsPlayedBomb != null && levelsPlayedBomb![0]
                    ? 'assets/buttons/lvl_1_played.png'
                    : 'assets/buttons/lvl_1_unplayed.png',
              ),
              LevelButton(
                isSelected: selectedLevelIndex == 1,
                onTap: () {
                  setState(() {
                    selectedLevelIndex = 1;
                    levelsPlayedBomb![1] = true;
                  });
                  Navigator.of(context).pushNamed(AppRoutes.pairLvl2);
                  _onStartLevel();
                },
                //  text: 'Lvl 2',
                beenPlayedBomb:
                    levelsPlayedBomb != null && levelsPlayedBomb![1],
                imagePath: levelsPlayedBomb != null && levelsPlayedBomb![1]
                    ? 'assets/buttons/lvl_2_played.png'
                    : 'assets/buttons/lvl_2_unplayed.png',
              ),
              LevelButton(
                isSelected: selectedLevelIndex == 2,
                onTap: () {
                  setState(() {
                    selectedLevelIndex = 2;
                    levelsPlayedBomb![2] = true;
                  });
                  Navigator.of(context).pushNamed(AppRoutes.pairLvl3);
                  _onStartLevel();
                },
                // text: 'lvl 3',
                beenPlayedBomb:
                    levelsPlayedBomb != null && levelsPlayedBomb![2],
                imagePath: levelsPlayedBomb != null && levelsPlayedBomb![2]
                    ? 'assets/buttons/lvl_3_played.png'
                    : 'assets/buttons/lvl_3_unplayed.png',
              ),
              LevelButton(
                isSelected: selectedLevelIndex == 3,
                onTap: () {
                  setState(() {
                    selectedLevelIndex = 3;
                    levelsPlayedBomb![3] = true;
                  });
                  Navigator.of(context).pushNamed(AppRoutes.pairLvl4);
                  _onStartLevel();
                },
                // text: 'lvl 4',
                beenPlayedBomb:
                    levelsPlayedBomb != null && levelsPlayedBomb![3],
                imagePath: levelsPlayedBomb != null && levelsPlayedBomb![3]
                    ? 'assets/buttons/lvl_4_played.png'
                    : 'assets/buttons/lvl_4_unplayed.png',
              ),
              LevelButton(
                isSelected: selectedLevelIndex == 4,
                onTap: () {
                  setState(() {
                    selectedLevelIndex = 4;
                    levelsPlayedBomb![4] = true;
                  });
                  Navigator.of(context).pushNamed(AppRoutes.pairLvl5);
                  _onStartLevel();
                },
                // text: 'lvl 5',
                beenPlayedBomb:
                    levelsPlayedBomb != null && levelsPlayedBomb![4],
                imagePath: levelsPlayedBomb != null && levelsPlayedBomb![4]
                    ? 'assets/buttons/lvl_5_played.png'
                    : 'assets/buttons/lvl_5_unplayed.png',
              ),
            ]),
          ),
          Positioned(
            top: screenHeight * 0.09,
            left: screenWidth * 0.01,
            child: Row(
              children: [
                NavigationButton(
                  assetName: 'assets/images/home.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.home,
                    );
                  },
                  buttonHeight: screenWidth * 0.17,
                  buttonWidth: screenWidth * 0.07,
                ),
                SizedBox(
                  width: screenWidth * 0.01,
                ),
                NavigationButton(
                  assetName: 'assets/images/settings.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.settingsScreen,
                    );
                  },
                  buttonHeight: screenWidth * 0.14,
                  buttonWidth: screenWidth * 0.07,
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.1,
            right: screenWidth * 0.02,
            child: const HeartWidget(),
          ),
        ]),
      ),
    );
  }
}
