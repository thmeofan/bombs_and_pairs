import 'package:bombs_and_pairs/views/pairs/pair_progress/widget/level_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/repository/score_repo.dart';
import '../../../../util/app_routes.dart';
import '../../../app/app/widgets/heart_widget.dart';
import '../../../app/app/widgets/navigation_button.dart';
import '../../../app/consts/app_colors.dart';

class BombProgressScreen extends StatefulWidget {
  const BombProgressScreen({super.key});

  @override
  _BombProgressScreenState createState() => _BombProgressScreenState();
}

class _BombProgressScreenState extends State<BombProgressScreen> {
  final int numberOfLevels = 5;
  int selectedPairLevelIndex = 0;
  List<bool>? levelsPlayedPair;

  _BombProgressScreenState() {
    levelsPlayedPair = List.generate(5, (_) => false);
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
      levelsPlayedPair = List.generate(numberOfLevels,
          (index) => prefs.getBool('levelPlayed$index') ?? false);
    });
  }

  Future<void> _savePlayedLevel(int levelIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('levelPlayed$levelIndex', true);
  }

  void _onStartLevel() {
    if (levelsPlayedPair == null) {
      return;
    }
    if (life >= 1) {
      setState(() {
        levelsPlayedPair![selectedPairLevelIndex] = true;
      });
      _savePlayedLevel(selectedPairLevelIndex);

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
              PairLevelButton(
                isSelected: selectedPairLevelIndex == 0,
                onTap: () {
                  setState(() {
                    selectedPairLevelIndex = 0;
                    levelsPlayedPair![0] = true;
                  });
                  _onStartLevel();
                  Navigator.of(context).pushNamed(AppRoutes.bombLvl1);
                },
                beenPlayedPair:
                    levelsPlayedPair != null && levelsPlayedPair![0],
                imagePath: levelsPlayedPair != null && levelsPlayedPair![0]
                    ? 'assets/buttons/lvl_1_played.png'
                    : 'assets/buttons/lvl_1_unplayed.png',
              ),
              PairLevelButton(
                isSelected: selectedPairLevelIndex == 1,
                onTap: () {
                  setState(() {
                    selectedPairLevelIndex = 1;
                    levelsPlayedPair![1] = true;
                  });
                  Navigator.of(context).pushNamed(AppRoutes.bombLvl2);
                  _onStartLevel();
                },
                beenPlayedPair:
                    levelsPlayedPair != null && levelsPlayedPair![1],
                imagePath: levelsPlayedPair != null && levelsPlayedPair![1]
                    ? 'assets/buttons/lvl_2_played.png'
                    : 'assets/buttons/lvl_2_unplayed.png',
              ),
              PairLevelButton(
                isSelected: selectedPairLevelIndex == 2,
                onTap: () {
                  setState(() {
                    selectedPairLevelIndex = 2;
                    levelsPlayedPair![2] = true;
                  });
                  Navigator.of(context).pushNamed(AppRoutes.bombLvl3);
                  _onStartLevel();
                },
                beenPlayedPair:
                    levelsPlayedPair != null && levelsPlayedPair![2],
                imagePath: levelsPlayedPair != null && levelsPlayedPair![2]
                    ? 'assets/buttons/lvl_3_played.png'
                    : 'assets/buttons/lvl_3_unplayed.png',
              ),
              PairLevelButton(
                isSelected: selectedPairLevelIndex == 3,
                onTap: () {
                  setState(() {
                    selectedPairLevelIndex = 3;
                    levelsPlayedPair![3] = true;
                  });
                  Navigator.of(context).pushNamed(AppRoutes.bombLvl4);
                  _onStartLevel();
                },
                beenPlayedPair:
                    levelsPlayedPair != null && levelsPlayedPair![3],
                imagePath: levelsPlayedPair != null && levelsPlayedPair![3]
                    ? 'assets/buttons/lvl_4_played.png'
                    : 'assets/buttons/lvl_4_unplayed.png',
              ),
              PairLevelButton(
                isSelected: selectedPairLevelIndex == 4,
                onTap: () {
                  setState(() {
                    selectedPairLevelIndex = 4;
                    levelsPlayedPair![4] = true;
                  });
                  Navigator.of(context).pushNamed(AppRoutes.bombLvl5);
                  _onStartLevel();
                },
                beenPlayedPair:
                    levelsPlayedPair != null && levelsPlayedPair![4],
                imagePath: levelsPlayedPair != null && levelsPlayedPair![4]
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
                  buttonHeight: screenWidth * 0.14,
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
