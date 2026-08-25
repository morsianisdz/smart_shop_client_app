import 'package:smart_shop_client_app/core/models/cimage.model.dart';

class User {
  User({
    required this.id,
    this.firstName,
    this.lastName,
    required this.email,
    required this.image,
    this.token,
    this.jointDate,
    this.phoneNumber,
    required this.memberStatus,
    required this.username,
    required this.activeShoppingLimit,
    required this.points,
  });

  final int id;
  final String? firstName;
  final String? lastName;
  final String username;
  final String email;
  final CImage image;
  final String? token;
  final DateTime? jointDate;
  final String? phoneNumber;
  final int points;
  final int memberStatus;
  final double activeShoppingLimit;

  factory User.fromJson(dynamic json) {
    return User(
      id: json['id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      image: CImage(url: json['image_url'], hash: json['image_hash']),
      token: json['token'],
      points: json['points'],
      phoneNumber: json['phone_number'],
      memberStatus: json['member_status'],
      activeShoppingLimit: json['active_shopping_limit'].toDouble(),
      jointDate: DateTime.parse(json['created_at']),
    );
  }

  static List<User> fromList(List<dynamic> list) {
    return list.map((item) => User.fromJson(item)).toList();
  }
}
