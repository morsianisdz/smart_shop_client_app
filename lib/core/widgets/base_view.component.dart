import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseView extends StatelessWidget {
  const BaseView(
      {super.key,
      this.gkey,
      this.appBarLeading,
      this.appBarEnd,
      required this.body,
      this.top = const [],
      this.transparent = false,
      this.extended = false,
      this.drawer,
      this.appBarTitle,
      this.backgroundColor = Colors.white,
      this.bottom});

  final GlobalKey<ScaffoldState>? gkey;
  final Widget? appBarLeading;
  final List<Widget>? appBarEnd;
  final Widget body;
  final Widget? appBarTitle;
  final List<Widget> top;
  final Widget? drawer;
  final bool transparent;
  final bool extended;
  final Color backgroundColor;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: gkey,
      endDrawer: drawer,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75),
          child: AppBar(
            clipBehavior: Clip.none,
            leading: appBarLeading,
            title: appBarTitle,
            actions: appBarEnd,
          ).paddingSymmetric(horizontal: 25, vertical: 18)),
      extendBodyBehindAppBar: extended,
      backgroundColor: backgroundColor,
      body: body,
      bottomSheet: bottom,
    );
  }
}
