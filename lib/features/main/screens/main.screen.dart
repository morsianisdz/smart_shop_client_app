import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/core/widgets/base_view.component.dart';
import 'package:smart_shop_client_app/features/main/components/custom_nav_bar.component.dart';
import 'package:smart_shop_client_app/features/main/providers/main.provider.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: IndexedStack(
        index: GetIt.instance<MainProvider>().currentIndex,
        children: GetIt.instance<MainProvider>().pages
            .map((page) => page.widget)
            .toList(),
      ),
      bottom: CustomNavBar(),
    );
  }
}
