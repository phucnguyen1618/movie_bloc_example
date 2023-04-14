import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/di.dart';
import 'package:movie_app/movie_observer.dart';

import 'app.dart';

Future<void> main() async {
  Bloc.observer = MovieObserver();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await DependencyInjection.init();
  runApp(const MyApp());
}
