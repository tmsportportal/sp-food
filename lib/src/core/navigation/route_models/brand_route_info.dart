class BrandRouteInfo {
  final String? brandName;
  final String? brandSlug;

  const BrandRouteInfo({
    required this.brandName,
    required this.brandSlug,
  });

  factory BrandRouteInfo.fromMap(Map<String, String> map) {
    return BrandRouteInfo(
      brandName: map['brandName'] ?? '',
      brandSlug: map['brandSlug'] ?? '',
    );
  }

  Map<String, String> toMap() => {
        "brandSlug": brandSlug ?? '',
        "brandName": brandName ?? '',
      };
}
