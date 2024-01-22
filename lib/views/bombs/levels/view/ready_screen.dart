// import 'package:flutter/material.dart';
// import '../../../../util/app_routes.dart';
// import '../../../app/app/widgets/heart_widget.dart';
// import '../../../app/app/widgets/navigation_button.dart';
// import '../../../app/consts/app_colors.dart';
// import '../../../app/consts/app_text_style/settings_style.dart';
// import '../widget/blinking_text.dart';
//
// class ReadyScreen extends StatefulWidget {
//   const ReadyScreen({super.key});
//
//   @override
//   State<ReadyScreen> createState() => _ReadyScreenState();
// }
//
// class _ReadyScreenState extends State<ReadyScreen> {
//   @override
//   void initState() {
//     super.initState();
//
//     Future.delayed(Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacementNamed(AppRoutes.lvl1);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/background.png'),
//             fit: BoxFit.cover,
//             colorFilter: ColorFilter.mode(
//               AppColors.darkRedColor.withOpacity(0.4),
//               BlendMode.darken,
//             ),
//           ),
//         ),
//         child: Stack(children: [
//           Align(
//             child: Container(
//               height: size.height * 0.9,
//               width: size.width * 0.6,
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                 image: AssetImage('assets/images/banner.png'),
//                 fit: BoxFit.contain,
//               )),
//               child: Center(
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                     top: size.height * 0.15,
//                     left: size.width * 0.02,
//                     right: size.width * 0.02,
//                   ),
//                   child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       childAspectRatio: 2,
//                       crossAxisSpacing: size.width * 0.001,
//                       mainAxisSpacing: size.width * 0.005,
//                     ),
//                     itemCount: 9,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.0),
//                           image: const DecorationImage(
//                             image: AssetImage('assets/images/closed_tile.png'),
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: size.height * 0.06,
//             left: 0,
//             right: 0,
//             child: const Align(
//               alignment: Alignment.center,
//               child: BlinkingText(
//                 text: 'READY',
//                 strokeWidth: 4,
//                 strokeColor: AppColors.redColor,
//                 textStyle: SettingsTextStyle.heavyStyle,
//               ),
//             ),
//           ),
//           Positioned(
//             top: size.height * 0.1,
//             left: size.width * 0.025,
//             child: Row(
//               children: [
//                 NavigationButton(
//                   assetName: 'assets/icons/home.png',
//                   onTap: () {
//                     Navigator.of(context).pushNamed(
//                       AppRoutes.home,
//                     );
//                   },
//                   buttonWidth: size.width * 0.06,
//                 ),
//                 NavigationButton(
//                   assetName: 'assets/icons/settings.png',
//                   onTap: () {
//                     Navigator.of(context).pushNamed(
//                       AppRoutes.settingsScreen,
//                     );
//                   },
//                   buttonWidth: size.width * 0.06,
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: size.height * 0.1,
//             right: size.width * 0.02,
//             child: HeartWidget(),
//           ),
//         ]),
//       ),
//     );
//   }
// }
