import 'package:bbs/presentation/resources/styles/icons/broken_icons.dart';
import 'package:bbs/presentation/view/splash/animations/info_view.dart';
import 'package:bbs/presentation/view/splash/animations/tab_info_model/info_strings.dart';
import 'package:flutter/material.dart';

class TabInfo {
  final IconData icon;
  final WidgetBuilder? builder;
  final String description;

  TabInfo(this.icon, this.description, {this.builder});

  static final List<TabInfo> tabs = [
    TabInfo(
      BrokenIcons.user_1,
      TabInfoStrings.nameInfo,
      builder: (_) => InfoView(key: UniqueKey()),
    ),
    TabInfo(
      BrokenIcons.message,
      TabInfoStrings.emailInfo,
    ),
    TabInfo(
      BrokenIcons.menu,
      TabInfoStrings.patchInfo,
    ),
    TabInfo(
      BrokenIcons.bank2,
      TabInfoStrings.projectInfo,
    ),
  ];
}
