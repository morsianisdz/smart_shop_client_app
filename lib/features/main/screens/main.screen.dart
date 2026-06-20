import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_client_app/core/helpers/state_managmenet.helper.dart';
import 'package:smart_shop_client_app/core/widgets/base_view.component.dart';
import 'package:smart_shop_client_app/features/main/components/custom_nav_bar.component.dart';
import 'package:smart_shop_client_app/features/main/providers/main.provider.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider = context.read<MainProvider>();
    waitBuilding(mainProvider.initiate);
    return sel<MainProvider, bool>(
      (c) => c.isLoading,
      (isLoading) => isLoading ? loading() : BaseView(
        body: sel<MainProvider, int>(
          (p) => p.currentIndex,
          (currentIndex) =>  IndexedStack(
            index: currentIndex,
            children: mainProvider.pages
                .map((page) => page.widget)
                .toList(),
          ),
        ),
        bottom: CustomNavBar(mainProvider: mainProvider),
      ),
    );
  }
}
