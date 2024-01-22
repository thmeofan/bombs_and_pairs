import 'package:bombs_and_pairs/views/app/app/widgets/chosen_action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../../../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../../../../util/app_routes.dart';
import '../../consts/app_text_style/menu_style.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //size=
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: const AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.dstATop,
          ),
        )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Image.asset('assets/images/toucan_thinking.png'),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/rasty_banner.png'),
                  fit: BoxFit.contain,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.35,
                      left: MediaQuery.of(context).size.height * 0.4,
                      right: MediaQuery.of(context).size.height * 0.4,
                    ),
                    child: const StrokeText(
                      strokeWidth: 4,
                      strokeColor: Colors.black,
                      text:
                          'Exciting memory and logic games! Take your pick: Pairs or Bombs',
                      textStyle: MenuTextStyle.lvlStyle,
                    ),
                  ),
                  ChosenActionButton(
                    text: 'Start',
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.4,
                    onTap: () {
                      context.read<OnboardingCubit>().setFirstTime();
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
