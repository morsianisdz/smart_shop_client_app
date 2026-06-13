import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/features/onboarding/models/on_boarding.model.dart';

class OnboardingData {
  static List<Onboarding> onboardingSteps = [
    Onboarding(
      title: AppText.earnPointLoyaltyRewards.tr,
      desc: AppText.accumulatePointsAutomatically.tr,
      icon: FontAwesomeIcons.crown,
      accentColor: ColorsConf.orange,
    ),
    Onboarding(
      title: AppText.instantCheckoutScanning.tr,
      desc: AppText.noPlasticCardsNeeded.tr,
      icon: FontAwesomeIcons.barcode,
      accentColor: ColorsConf.blue,
    ),
    Onboarding(
      title: AppText.smartBudgetControls.tr,
      desc: AppText.takeChargeOfYourFinances.tr,
      icon: FontAwesomeIcons.sliders,
      accentColor: ColorsConf.green,
    ),
  ];
}
