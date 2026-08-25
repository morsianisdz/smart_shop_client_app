import 'package:get/get.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';

String getStatus(int member_status) {
  switch(member_status) {
    case 0: return AppText.simpleTier.tr;
    case 1: return AppText.bronzeTier.tr;
    case 2: return AppText.silverTier.tr;
    case 3: return AppText.goldTier.tr;
    case 4: return AppText.diamondTier.tr;
    default: return AppText.simpleTier.tr;
  }
}