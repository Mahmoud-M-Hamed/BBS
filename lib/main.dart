import 'package:bbs/application/service_setup_locator/dependancy_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'application/application.dart';
import 'application/observer/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DependencyInjectionService.callSingletonDependency;
  FlutterNativeSplash.remove();

  runApp(MyApp());
}
