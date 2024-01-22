import 'package:bombs_and_pairs/views/app/app/widgets/chosen_action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../../../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../../../../util/app_routes.dart';
import '../../consts/app_colors.dart';
import '../../consts/app_text_style/onboarding_style.dart';
import '../widget/start_game_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //size=
    return Material(
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                AppColors.darkRedColor.withOpacity(0.4),
                BlendMode.darken,
              ),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.125,
                      left: MediaQuery.of(context).size.width * 0.08,
                      right: MediaQuery.of(context).size.width * 0.08),
                  child: const StrokeText(
                    strokeWidth: 4,
                    strokeColor: AppColors.redColor,
                    text:
                        'Exciting memory and logic games! Take your pick: Pairs or Bombs',
                    textStyle: OnboardingTextStyle.description,
                  ),
                ),
                Spacer(),
                ChosenActionButton(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.height * 0.35,
                  text: 'Start',
                  onTap: () {
                    context.read<OnboardingCubit>().setFirstTime();
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          )),
    );
  }
}
