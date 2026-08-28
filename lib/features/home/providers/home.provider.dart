import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/core/widgets/snackbar.component.dart';
import 'package:smart_shop_client_app/features/home/components/set_shopping_limit_modal_sheet.component.dart';
import 'package:smart_shop_client_app/features/offers/models/coupon_off.model.dart';
import 'package:smart_shop_client_app/features/offers/repositories/offer.repository.dart';
import 'package:smart_shop_client_app/shared/providers/user.provider.dart';
import 'package:smart_shop_client_app/shared/repositories/carts.repositories.dart';

class HomeProvider extends ChangeNotifier {
  bool _isLoading = true;
  bool _isButtonLoading = true;
  late List<CouponOfferModel> offers;

  bool get isLoading => _isLoading;
  bool get isButtonLoading => _isButtonLoading;

  TextEditingController get limitFieldController => _limitFieldController;

  final TextEditingController _limitFieldController = TextEditingController();

  void initiate() async {
    await getOffers();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getOffers() async {
    try {
      offers = await OfferRepository().getOffers();
    } catch (e) {
      CSnackBar.failed(e.toString());
    }
  }

  void onSetLimitPressed(BuildContext context, HomeProvider homeProvider) async {
    _isButtonLoading = false;
    notifyListeners();
    await _showSetLimitModalSheet(context, homeProvider);
  }

  Future<void> _showSetLimitModalSheet(BuildContext context, HomeProvider homeProvider) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor:
          Colors.transparent, // Required for custom rounded corners
      builder: (context) {
        return SetShoppingLimitModalSheet(homeProvider: homeProvider);
      },
    );
  }

  void setLimit() async {
    _isButtonLoading = true;
    notifyListeners();

    double limit = double.parse(_limitFieldController.text);

    try {
      await CartsRepositories().setActiveShoppingLimit(limit);
    } catch (e) {
      CSnackBar.failed(e.toString());
      return;
    }

    _isButtonLoading = false;
    notifyListeners();

    GetIt.instance<UserProvider>().user!.activeShoppingLimit = limit;

    Get.back();
  }
}
