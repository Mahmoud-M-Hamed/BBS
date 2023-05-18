import 'package:bbs/presentation/resources/routes/routes.dart';
import 'package:bbs/presentation/resources/styles/colors/colors_manager.dart';
import 'package:bbs/presentation/resources/time_duration/duration_manager.dart';
import 'package:bbs/presentation/view/splash/animations/tab_info_model/tab_model.dart';
import 'package:bbs/presentation/view_model/customer/database_cubit/database_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/customer/database_cubit/database_cubit.dart';

class SplashScreenActivity extends StatelessWidget {
  const SplashScreenActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseCubit, DatabaseState>(
      builder: (context, state) {
        return const AnimationViewBuilder();
      },
    );
  }
}

class AnimationViewBuilder extends StatefulWidget {
  const AnimationViewBuilder({Key? key}) : super(key: key);

  @override
  State<AnimationViewBuilder> createState() => _AnimationViewBuilderState();
}

class _AnimationViewBuilderState extends State<AnimationViewBuilder> {
  @override
  void initState() {
    super.initState();
    navigateToHomeActivity();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.kPrimaryColor,
        body: TabInfo.tabs[0].builder!(context),
      ),
    );
  }

  void navigateToHomeActivity() {
    Future.delayed(
        const Duration(seconds: 10),
        () => Navigator.of(context)
            .pushReplacementNamed(RoutesManager.homeRoute));
  }
}
