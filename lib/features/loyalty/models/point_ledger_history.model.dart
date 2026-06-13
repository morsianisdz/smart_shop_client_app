import 'package:smart_shop_client_app/features/loyalty/enums/ledger_transaction_type.enum.dart';

class PointLedger {
  final String id;
  final String title;
  final String subtitle;
  final DateTime transactionDate;
  final int pointsAmount;
  final LedgerTransactionType type;

  PointLedger({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.transactionDate,
    required this.pointsAmount,
    required this.type,
  });

  factory PointLedger.fromJson(dynamic json) {
    return PointLedger(
      id: json["id"],
      title: json['discount'],
      subtitle: json['description'],
      transactionDate: json['points'],
      pointsAmount: json['pointsAmount'],
      type: LedgerTransactionType.values.firstWhere(
        (e) => e.toString() == 'LedgerTransactionType.${json['LedgerTransactionType']}',
      ),
    );
  }

  static List<PointLedger> fromList(List<dynamic> list) {
    return list.map((item) => PointLedger.fromJson(item)).toList();
  }
}