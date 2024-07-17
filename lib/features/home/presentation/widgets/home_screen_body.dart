import 'package:flutter/cupertino.dart';

import 'custome_app_bar.dart';
import 'custome_book_image.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const[
        CustomAppBar(),
        CustomBookImage(),
      ],
    );
  }
}
