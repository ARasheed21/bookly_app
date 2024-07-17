import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:udemy8_bookly/core/utils/asset_path.dart';

import '../../../../constants.dart';
import '../../../home/presentation/screens/home_screen.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {

  @override
  void initState() {
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetPath.logo),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
          () {
        Get.to(() => const HomeScreen(),
            transition: Transition.fade,
            duration: kTranstionDuration);

        //GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }
}
