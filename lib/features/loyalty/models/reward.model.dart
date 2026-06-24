class Reward {
  final int id;
  final double discount;
  final String description;
  final int points;

  Reward({
    required this.id,
    required this.discount,
    required this.description,
    required this.points,
  });

  factory Reward.fromJson(dynamic json) {
    return Reward(
      id: json["id"],
      discount: json['discount'],
      description: json['description'],
      points: json['points'],
    );
  }

  static List<Reward> fromList(List<dynamic> list) {
    return list.map((item) => Reward.fromJson(item)).toList();
  }
}