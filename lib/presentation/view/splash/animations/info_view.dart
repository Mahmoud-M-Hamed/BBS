import 'package:bbs/application/extensions/extensions.dart';
import 'package:bbs/presentation/resources/spaces/spaces.dart';
import 'package:bbs/presentation/resources/styles/colors/colors_manager.dart';
import 'package:bbs/presentation/resources/styles/fonts/font_manager.dart';
import 'package:bbs/presentation/resources/time_duration/duration_manager.dart';
import 'package:bbs/presentation/view/splash/animations/tab_info_model/info_strings.dart';
import 'package:bbs/presentation/view/splash/animations/tab_info_model/tab_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class InfoView extends StatelessWidget {
  const InfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title = Center(
      child: Text(
        TabInfoStrings.companyInfo,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: FontSizeManager.s40,
              height: 1,
              letterSpacing: -1,
              color: ColorsManager.kBlueGreyColor,
            ),
      ),
    );

    title = title
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(
          duration: TimeIntervalDurationManager.t2200.ms,
          color: ColorsManager.kAnimationTitleColor,
        )
        .animate()
        .fadeIn(
          duration: TimeIntervalDurationManager.t2200.ms,
          curve: Curves.easeOutQuad,
        )
        .slide();

    List<Widget> tabInfoItems = [
      for (final tab in TabInfo.tabs)
        Container(
          padding: const EdgeInsets.all(SpacePaddingManager.p8),
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(tab.icon, color: ColorsManager.kAnimationTitleColor),
              SpaceEmptyManager.s8.pw,
              Flexible(
                child: Text(
                  tab.description,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ],
          ),
        )
    ];

    tabInfoItems = tabInfoItems
        .animate(autoPlay: true, interval: 1500.ms)
        .fadeIn(
            duration: 2000.ms,
            delay: TimeIntervalDurationManager.t1000.ms)
        .shimmer(
            blendMode: BlendMode.srcOver, color: ColorsManager.kWhiteColor12)
        .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad);

    return Padding(
      padding: const EdgeInsets.all(SpacePaddingManager.p12),
      child: Column(
        children: [
          SpaceEmptyManager.s50.ph,
          title,
          SpaceEmptyManager.s50.ph,
          ...tabInfoItems,
        ],
      ),
    );
  }
}
