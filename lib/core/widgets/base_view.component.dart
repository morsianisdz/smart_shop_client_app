import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';

class BaseView extends StatelessWidget {
  const BaseView(
      {super.key,
      this.gkey,
      this.appBarLeading,
      this.appBarEnd,
      required this.body,
      this.top = const [],
      this.extended = true,
      this.drawer,
      this.appBarTitle,
      this.backgroundColor,
      this.bottom});

  final GlobalKey<ScaffoldState>? gkey;
  final Widget? appBarLeading;
  final List<Widget>? appBarEnd;
  final Widget body;
  final Widget? appBarTitle;
  final List<Widget> top;
  final Widget? drawer;
  final bool extended;
  final Color? backgroundColor;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: gkey,
      endDrawer: drawer,
      extendBodyBehindAppBar: false,
      backgroundColor: backgroundColor ?? colorScheme(context).surface,
      body: SafeArea(child: body),
      bottomNavigationBar: bottom,
    );
  }
}
