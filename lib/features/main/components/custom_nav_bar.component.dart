import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/features/main/models/page.model.dart';
import 'package:smart_shop_client_app/features/main/providers/main.provider.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.mainProvider});

  final MainProvider mainProvider;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: mainProvider,
      builder: (context, _) {
        return Container(
          margin: const EdgeInsets.all(UiConf.navBarMargin),
          padding: const EdgeInsets.symmetric(
            horizontal: UiConf.navBarItemHorizontalPadding,
            vertical: UiConf.navBarItemVerticalPadding,
          ),
          decoration: BoxDecoration(
            color: colorScheme(context).primaryContainer,
            borderRadius: BorderRadius.circular(UiConf.navBarCornerRadius),
          ),
          child: mainProvider.pages
              .map(
                (page) => _buildBottomBarIcons(
                  context,
                  page,
                  mainProvider,
                ).onInkTap(() => mainProvider.sweapScreen(page.index)),
              )
              .toList()
              .row(alignment: MainAxisAlignment.spaceBetween),
        );
      },
    );
  }

  Widget _buildBottomBarIcons(
    BuildContext context,
    AppPage page,
    MainProvider provider,
  ) {
    final bool isSelected = provider.currentIndex == page.index;
    return [
          FaIcon(
            page.icon,
            size: UiConf.navBarIconSize,
            color: isSelected ? Colors.orange : Colors.grey,
          ).paddingOnly(bottom: UiConf.navBarLabelSpacing),
          cBodySmall(
            context,
            page.title.tr.toUpperCase(),
            color: isSelected
                ? colorScheme(context).primary
                : colorScheme(context).onPrimaryContainer,
          ),
        ]
        .column(axisSize: MainAxisSize.min)
        .onTap(() => provider.setCurrentIndex(page.index));
  }
}
