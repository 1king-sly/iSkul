import 'package:flutter/material.dart';
import 'package:ischool/utils/app_styles.dart';

final Widget dashBoardDrawer = Drawer(
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.zero,
  ),
  child: Container(
    padding: const EdgeInsets.all(8.0),
    color: AppTheme.white,
    child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [Text("SideBar")]),
  ),
);
