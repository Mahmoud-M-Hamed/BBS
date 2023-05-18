import 'package:bbs/application/constants/constants.dart';
import 'package:bbs/presentation/view/home/home.dart';
import 'package:bbs/presentation/view/info_details/details.dart';
import 'package:bbs/presentation/view/splash/splash.dart';
import 'package:bbs/presentation/view/transfer/transfer.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static const String splashScreenRoute = '/splashScreen';
  static const String homeRoute = '/home';
  static const String infoRoute = '/info';
  static const String transferRoute = '/transfer';
}

class RoutesGenerator {
  static Route getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesManager.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreenActivity());
      case RoutesManager.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeActivity());
      case RoutesManager.infoRoute:
        return MaterialPageRoute(builder: (_) => const InfoDetailsActivity());
      case RoutesManager.transferRoute:
        return MaterialPageRoute(
            builder: (_) => const TransferProcessActivity());
      default:
        return unDefinedRoute();
    }
  }

  static Route unDefinedRoute() =>
      MaterialPageRoute(builder: (_) => _unDefinedRouteActivity());

  static Scaffold _unDefinedRouteActivity() => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppConstants.kRouteNotFound,
          ),
        ),
        body: const Center(
          child: Text(
            AppConstants.kRouteNotFound,
          ),
        ),
      );
}
