import 'dart:developer';

import 'package:bloc/bloc.dart';

class MovieObserver extends BlocObserver {

  @override
  void onChange(BlocBase bloc, Change change) {
    log('On Change: ${bloc.state} $change');
    super.onChange(bloc, change);
  }
}