import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/base_view.component.dart';
import 'package:smart_shop_client_app/core/widgets/button.component.dart';
import 'package:smart_shop_client_app/features/onboarding/components/page_item.component.dart';
import 'package:smart_shop_client_app/features/onboarding/providers/onboarding.provider.dart';
import 'package:velocity_x/velocity_x.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingProvider onboardingProvider =
        GetIt.instance<OnboardingProvider>();
    return BaseView(
      body: col([
        row([
          cTitleSmall(
            context,
            AppText.appName.tr,
            color: colorScheme(context).primary,
          ),
          cTitleSmall(context, AppText.skip.tr).onTap(
            () => onboardingProvider.pageController.jumpToPage(
              onboardingProvider.onboardingSteps.length - 1,
            ),
          ),
        ], align: MainAxisAlignment.spaceBetween),
        PageView.builder(
          controller: onboardingProvider.pageController,
          onPageChanged: onboardingProvider.onPageChanged,
          itemCount: onboardingProvider.onboardingSteps.length,
          itemBuilder: (context, index) =>
              PageItem(step:  onboardingProvider.onboardingSteps[index]),
        ).expand(),

        col([
          row(
            List.generate(onboardingProvider.onboardingSteps.length, (index) {
              final isCurrent = onboardingProvider.currentIndex == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 6,
                width: isCurrent ? 24 : 6,
                decoration: BoxDecoration(
                  color: isCurrent
                      ? const Color(0xFFF97316)
                      : const Color(0xFF374151),
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          size: MainAxisSize.min).centered().paddingOnly(bottom: 24),
          CButton.withIcon(onboardingProvider.handleNext, row([
              cTitleSmall(context, (onboardingProvider.currentIndex ==
                          onboardingProvider.onboardingSteps.length - 1
                      ? AppText.getStarted.tr
                      : AppText.nextStep.tr).toUpperCase(), color: colorScheme(context).onSurface).paddingOnly(right: 8),
              FaIcon(
                onboardingProvider.currentIndex ==
                        onboardingProvider.onboardingSteps.length - 1
                    ? FontAwesomeIcons.checkDouble
                    : FontAwesomeIcons.arrowRight,
                size: 14,color: colorScheme(context).onSurface,
              ),
            ])),
        ]).pOnly(bottom: 24),
      ]).paddingOnly(top: 48),
    ).paddingSymmetric(horizontal: 16);
  }

}
