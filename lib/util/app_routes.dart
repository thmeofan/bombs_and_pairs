import 'package:bombs_and_pairs/views/bombs/levels/view/lvl_five.dart';
import 'package:bombs_and_pairs/views/bombs/levels/view/lvl_four.dart';
import 'package:bombs_and_pairs/views/bombs/levels/view/lvl_one.dart';
import 'package:bombs_and_pairs/views/pairs/pair_progress/view/progress_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../data/repository/onboarding_repo.dart';
import '../views/app/app/view/splash.dart';
import '../views/app/menu/view/menu_screen.dart';
import '../views/app/onboarding/view/onboarding_screen.dart';
import '../views/app/settings/view/settings_screen.dart';
import '../views/bombs/bomb_progress/view/progress_screen.dart';
import '../views/bombs/bomb_result/view/result_screen.dart';
import '../views/bombs/levels/view/lvl_three.dart';
import '../views/bombs/levels/view/lvl_two.dart';
import '../views/pairs/levels/view/lvl_five.dart';
import '../views/pairs/levels/view/lvl_four.dart';
import '../views/pairs/levels/view/lvl_one.dart';
import '../views/pairs/levels/view/lvl_three.dart';
import '../views/pairs/levels/view/lvl_two.dart';

abstract class AppRoutes {
  static const home = 'home';
  static const welcome = 'welcome';
  // static const menu = 'menu';
  static const splash = '/splash';
  static const onboarding = 'onboarding';
  static const settingsScreen = 'settings';

  static const bombProgress = 'progressB';
  static const bombLvl1 = 'bombLvl1';
  static const bombLvl2 = 'bombLvl2';
  static const bombLvl3 = 'bombLvl3';
  static const bombLvl4 = 'bombLvl4';
  static const bombLvl5 = 'bombLvl5';

  static const pairProgress = 'progressP';
  static const pairLvl1 = 'pairLvl1';
  static const pairLvl2 = 'pairLvl2';
  static const pairLvl3 = 'pairLvl3';
  static const pairLvl4 = 'pairLvl4';
  static const pairLvl5 = 'pairLvl5';
  static const result = 'result';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final Widget child;

    OnboardingRepository onboardingRepository = OnboardingRepository();
    OnboardingCubit onboardingCubit = OnboardingCubit(onboardingRepository);

    switch (settings.name) {
      case onboarding:
        child = BlocProvider(
          create: (context) => onboardingCubit,
          child: const OnboardingScreen(),
        );
      case home:
        child = const MenuScreen();
      case settingsScreen:
        child = const SettingsScreen();
      case result:
        child = const ResultScreen();
      case bombLvl1:
        child = const BombLvlOne();
      case bombLvl2:
        child = const BombLvlTwo();
      case bombLvl3:
        child = const BombLvlThree();
      case bombLvl4:
        child = const BombLvlFour();
      case bombLvl5:
        child = const BombLvlFive();
      case bombProgress:
        child = const BombProgressScreen();
      case pairProgress:
        child = const PairProgressScreen();
      case pairLvl1:
        child = const PairLvlOne();
      case pairLvl2:
        child = const PairLvlTwo();
      case pairLvl3:
        child = const PairLvlThree();
      case pairLvl4:
        child = const PairLvlFour();
      case pairLvl5:
        child = const PairLvlFive();

      default:
        child = BlocProvider(
          create: (context) => onboardingCubit,
          child: SplashScreen(
            onboardingRepository: onboardingRepository,
            homeRoute: AppRoutes.home,
            onboardingRoute: AppRoutes.onboarding,
          ),
        );
    }
    return MaterialPageRoute(builder: (_) => child);
  }
}
