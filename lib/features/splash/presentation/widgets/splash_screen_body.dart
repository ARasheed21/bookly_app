import 'package:flutter/cupertino.dart';
import 'package:udemy8_bookly/core/utils/assets_paths.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

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
}
