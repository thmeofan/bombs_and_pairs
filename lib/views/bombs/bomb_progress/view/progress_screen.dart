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
  List<bool>? levelsPlayed;

  _HomeScreenState() {
    levelsPlayed = List.generate(5, (_) => false);
  }

  @override
  void initState() {
    super.initState();
    _loadPlayedLevels();
  }

  Future<void> _loadPlayedLevels() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      levelsPlayed = List.generate(numberOfLevels,
          (index) => prefs.getBool('levelPlayed$index') ?? false);
    });
  }

  Future<void> _savePlayedLevel(int levelIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('levelPlayed$levelIndex', true);
  }

  void _onStartLevel() {
    if (levelsPlayed == null) {
      return;
    }
    if (life >= 1) {
      setState(() {
        levelsPlayed![selectedLevelIndex] = true;
      });
      _savePlayedLevel(selectedLevelIndex);
      score -= 10;
      life -= 1;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Sorry, you\'re out of lives',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFFEAAD82),
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
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              AppColors.darkRedColor.withOpacity(0.4),
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
                  });
                  _onStartLevel();
                  Navigator.of(context).pushNamed(AppRoutes.pairLvl1);
                },
                text: 'lvl 1',
                beenPlayed: levelsPlayed != null && levelsPlayed![0],
                imagePath: levelsPlayed != null && levelsPlayed![0]
                    ? 'assets/images/played_lvl_up.png'
                    : 'assets/images/unplayed_lvl_up.png',
              ),
              LevelButton(
                isSelected: selectedLevelIndex == 1,
                onTap: () {
                  setState(() {
                    selectedLevelIndex = 1;
                  });
                  Navigator.of(context).pushNamed(AppRoutes.pairLvl2);
                  _onStartLevel();
                },
                text: 'lvl 2',
                beenPlayed: levelsPlayed != null && levelsPlayed![1],
                imagePath: levelsPlayed != null && levelsPlayed![1]
                    ? 'assets/images/played_lvl_down.png'
                    : 'assets/images/unplayed_lvl_down.png',
              ),
              LevelButton(
                isSelected: selectedLevelIndex == 2,
                onTap: () {
                  setState(() {
                    selectedLevelIndex = 2;
                  });
                  Navigator.of(context).pushNamed(AppRoutes.pairLvl3);
                  _onStartLevel();
                },
                text: 'lvl 3',
                beenPlayed: levelsPlayed != null && levelsPlayed![2],
                imagePath: levelsPlayed != null && levelsPlayed![2]
                    ? 'assets/images/played_lvl_up.png'
                    : 'assets/images/unplayed_lvl_up.png',
              ),
              LevelButton(
                isSelected: selectedLevelIndex == 3,
                onTap: () {
                  setState(() {
                    selectedLevelIndex = 3;
                  });
                  Navigator.of(context).pushNamed(AppRoutes.pairLvl4);
                  _onStartLevel();
                },
                text: 'lvl 4',
                beenPlayed: levelsPlayed != null && levelsPlayed![3],
                imagePath: levelsPlayed != null && levelsPlayed![3]
                    ? 'assets/images/played_lvl_down.png'
                    : 'assets/images/unplayed_lvl_down.png',
              ),
              LevelButton(
                isSelected: selectedLevelIndex == 4,
                onTap: () {
                  setState(() {
                    selectedLevelIndex = 4;
                  });
                  Navigator.of(context).pushNamed(AppRoutes.pairLvl5);
                  _onStartLevel();
                },
                text: 'lvl 5',
                beenPlayed: levelsPlayed != null && levelsPlayed![4],
                imagePath: levelsPlayed != null && levelsPlayed![4]
                    ? 'assets/images/played_lvl_up.png'
                    : 'assets/images/unplayed_lvl_up.png',
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
                  buttonHeight: screenWidth * 0.12,
                  buttonWidth: screenWidth * 0.06,
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
                  buttonHeight: screenWidth * 0.12,
                  buttonWidth: screenWidth * 0.06,
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.1,
            right: screenWidth * 0.02,
            child: HeartWidget(),
          ),
        ]),
      ),
    );
  }
}
