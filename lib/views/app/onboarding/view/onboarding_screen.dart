import 'package:bombs_and_pairs/views/app/app/widgets/chosen_action_button_widget.dart';
import 'package:bombs_and_pairs/views/app/consts/app_text_style/onboarding_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../../../../util/app_routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: const AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(1),
              BlendMode.dstATop,
            ),
          )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.05,
                    top: MediaQuery.of(context).size.height * 0.2),
                child: Image.asset('assets/images/toucan_thinking.png'),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/solid_banner.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.3,
                          left: MediaQuery.of(context).size.height * 0.3,
                          right: MediaQuery.of(context).size.height * 0.28,
                        ),
                        child: const Text(
                          'Exciting memory and logic games! Take your pick: Pairs or Bombs',
                          style: OnboardingTextStyle.introduction,
                        ),
                      ),
                      const Spacer(),
                      ChosenActionButton(
                        text: 'Start',
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.height * 0.4,
                        onTap: () {
                          context.read<OnboardingCubit>().setFirstTime();
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.home);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
