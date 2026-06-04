class WebPage {
  WebPage({
    required this.domaineName,
    required this.url,
  });

  final String? domaineName;
  final String? url;

  factory WebPage.fromJson(dynamic json) {
    return WebPage(domaineName: json["domaineName"], url: json["url"]);
  }
}
