import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/shared/providers/market.provider.dart';

String priceBuilder(String amount) => "${GetIt.instance<MarketProvider>().market == null ? "\$" : GetIt.instance<MarketProvider>().market!.currency}$amount";