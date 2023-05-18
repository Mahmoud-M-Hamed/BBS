import 'package:bbs/application/constants/constants.dart';
import 'package:bbs/presentation/resources/routes/routes.dart';
import 'package:bbs/presentation/resources/styles/colors/colors_manager.dart';
import 'package:bbs/presentation/view/home/widgets/list.dart';
import 'package:flutter/material.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorsManager.kPrimaryColor,
            appBar: AppBar(
              title: const Text(AppConstants.kAppTitle),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RoutesManager.transferRoute);
                  },
                  child: Text(
                    'All Transfers',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
            body: const HomeListViewBuilder()));
  }
}
