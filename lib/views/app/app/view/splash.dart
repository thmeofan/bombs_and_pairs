import 'package:flutter/material.dart';

import '../../../../data/repository/onboarding_repo.dart';
import '../../../../util/app_routes.dart';

class SplashScreen extends StatefulWidget {
  final OnboardingRepository onboardingRepository;
  final String homeRoute;
  final String onboardingRoute;

  const SplashScreen({
    Key? key,
    required this.homeRoute,
    required this.onboardingRepository,
    required this.onboardingRoute,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    _simulateProgress();
  }

  void _simulateProgress() {
    Future.delayed(const Duration(milliseconds: 50), () {
      if (progress < 1.0) {
        setState(() {
          progress += 0.01;
          if (progress > 1.0) {
            progress = 1.0;
          }
        });
        _simulateProgress();
      } else {
        _navigateToNextScreen();
      }
    });
  }

  void _navigateToNextScreen() async {
    bool isFirstLaunch = await OnboardingRepository().checkFirstTime();
    if (isFirstLaunch) {
      await OnboardingRepository().setFirstTime();
      Navigator.of(context).pushReplacementNamed(AppRoutes.onboarding);
    } else {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Spacer(),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[800],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.grey),
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ],
      ),
    );
  }
}
