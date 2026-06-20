import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_shop_client_app/core/models/cimage.model.dart';
import 'package:smart_shop_client_app/features/loyalty/enums/ledger_transaction_type.enum.dart';
import 'package:smart_shop_client_app/features/loyalty/models/coupon.model.dart';
import 'package:smart_shop_client_app/features/loyalty/models/point_ledger_history.model.dart';
import 'package:smart_shop_client_app/features/loyalty/models/reward.model.dart';
import 'package:smart_shop_client_app/features/notifications/enums/notification_type.enum.dart';
import 'package:smart_shop_client_app/features/notifications/models/notifications_item.model.dart';
import 'package:smart_shop_client_app/shared/models/product.model.dart';
import 'package:smart_shop_client_app/shared/models/user.model.dart';

class FakeData {
  static List<Product> products = [
    Product(
      id: 1,
      name: "Sila Olive oil 500ml",
      price: 250,
      tag: "10% off",
      barcode: "613254117475",
      image: CImage(
        url:
            "https://static.vecteezy.com/system/resources/thumbnails/059/028/147/small_2x/olive-oil-bottle-product-liquid-food-cooking-ingredient-isolated-on-transparent-background-png.png",
        hash: "4965sdf484s6df49",
      ),
    ),
    Product(
      id: 1,
      name: "Special Milk 1L",
      price: 130,
      oldPrice: 200,
      barcode: "613254117475",
      tag: "ORGANIC, GLUTEN-FREE",
      image: CImage(
        url:
            "https://static.vecteezy.com/system/resources/previews/035/410/276/non_2x/groceries-theme-3d-milk-product-almond-milk-bottle-on-a-transparent-background-3d-rendering-free-png.png",
        hash: "4965sdf484s6df49",
      ),
    ),
  ];

  static List<Reward> rewards = [
    Reward(
      id: 1,
      discount: '5',
      description: 'Bakery & Deli Items',
      points: 150,
    ),
    Reward(
      id: 2,
      discount: '15',
      description: 'Fresh Meat Produce',
      points: 300,
    ),
    Reward(
      id: 3,
      discount: '20',
      description: 'Dairy & Frozen Goods',
      points: 400,
    ),
  ];

  static List<Coupon> coupons = [
    Coupon(
      id: 1,
      icon: FontAwesomeIcons.beerMugEmpty,
      tagText: "20% OFF",
      title: "Organic Milk 1G",
      subtitle: "All fat variants",
    ),
    Coupon(
      id: 2,
      icon: FontAwesomeIcons.mugHot,
      tagText: "\$2.50 OFF",
      title: "Coffee Beans",
      subtitle: "Arabica blends",
    ),
  ];

  static User user = User(
    id: 1,
    username: "MorsiAnisDZ",
    phoneNumber: "+213660311490",
    email: "tadjeddineanismorsi@gmail.com",
    token: "jhkzerjzerjkzrkhuzherjkzer6465468zeerkzerjzer4564z46zer",
    image: CImage(
      url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC8kiSH5ZSAcVoj3tAQQDoP_ux0sSricMyUg&s",
    ),
  );

  static List<PointLedger> mockLedgerHistory = [
    PointLedger(
      id: '1',
      title: 'Central Grocers Store #12',
      subtitle: 'June 12, 2026 • Receipt #1094',
      transactionDate: DateTime(2026, 6, 12),
      pointsAmount: 120,
      type: LedgerTransactionType.accrual, // إضافة نقاط
    ),
    PointLedger(
      id: '2',
      title: '\$5 Reward Voucher Claim',
      subtitle: 'June 04, 2026 • Digital Redemption',
      transactionDate: DateTime(2026, 6, 4),
      pointsAmount: 150,
      type: LedgerTransactionType.redemption, // خصم نقاط
    ),
    PointLedger(
      id: '3',
      title: 'Organic Harvest Co-Op',
      subtitle: 'May 28, 2026 • Receipt #0041',
      transactionDate: DateTime(2026, 5, 28),
      pointsAmount: 450,
      type: LedgerTransactionType.accrual, // إضافة نقاط
    ),
  ];

  static List<NotificationItemModel> notifications = [
    NotificationItemModel(
      id: 1,
      title: "Points Credited!",
      description:
          "You just earned +150 Pts from your last checkout at Area 4 Market.",
      timestamp: "2 mins ago",
      icon: FontAwesomeIcons.star,
      isUnread: true,
      type: NotificationType.wining
    ),
    NotificationItemModel(
      id: 1,
      title: "Clipped Coupon Expiring",
      description:
          "Your 20% Off Bakery & Deli coupon expires in 3 hours. Use it soon!",
      timestamp: "1 hour ago",
      icon: FontAwesomeIcons.clock,
      isUnread: true,
      type: NotificationType.notification
    ),
    NotificationItemModel(
      id: 1,
      title: "Successful Checkout",
      description: "Receipt #SS-98421 has been generated. Total paid: \$42.50.",
      timestamp: "Yesterday",
      icon: FontAwesomeIcons.receipt,
      isUnread: false,
      type: NotificationType.success
    ),
  ];
}
