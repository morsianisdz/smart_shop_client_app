class CPosition {
  CPosition({required this.latitude, required this.longitude, this.adress});

  final double? latitude;
  final double? longitude;
  final String? adress;

  factory CPosition.fromJson(dynamic json) {
    return CPosition(
        latitude: json["latitude"],
        longitude: json["longitude"],
        adress: json["adress"]);
  }
}
