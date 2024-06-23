class CategoryRouteInfo {
  final String? categorySlug;

  const CategoryRouteInfo({
    required this.categorySlug,
  });

  factory CategoryRouteInfo.fromMap(Map<String, String> map) {
    return CategoryRouteInfo(
      categorySlug: map['categorySlug'] ?? '',
    );
  }

  Map<String, String> toMap() => {
        "categorySlug": categorySlug ?? '',
      };
}
