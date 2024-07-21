
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('chnage: ${change.toString()}');
    super.onChange(bloc, change);
  }
}