class CImage {
  CImage({required this.url, this.hash});

  final String url;
  final String? hash;

  factory CImage.fromJson(dynamic json) {
    return CImage(url: json["url"], hash: json['hash']);
  }
}
