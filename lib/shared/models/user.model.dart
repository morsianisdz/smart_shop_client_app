import 'package:smart_shop_client_app/core/models/cimage.model.dart';

class User {
  User({
    required this.id,
    this.firstName,
    this.lastName,
    required this.email,
    required this.image,
    required this.token,
    this.jointDate,
    required this.phoneNumber,
    required this.username,
  });

  final int id;
  final String? firstName;
  final String? lastName;
  final String username;
  final String email;
  final CImage image;
  final String token;
  final DateTime? jointDate;
  final String? phoneNumber;

  factory User.fromJson(dynamic json) {
    return User(
      id: json['id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      image: CImage(url: json['image_url'], hash: json['image_hash']),
      token: json['token'],
      phoneNumber: json['phoneNumber'],
      jointDate: DateTime.parse(json['create_at']),
    );
  }

  static List<User> fromList(List<dynamic> list) {
    return list.map((item) => User.fromJson(item)).toList();
  }
}
