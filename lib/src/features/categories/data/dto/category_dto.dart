class CategoryDto {
  final int? id;
  final String? name;
  final String? icon;
  final String? slug;
  final List<CategoryDto>? children;

  const CategoryDto({
    this.id,
    this.name,
    this.icon,
    this.slug,
    this.children,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) => CategoryDto(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        slug: json["slug"],
        children: json["children"] == null
            ? []
            : List<CategoryDto>.from(
                json["children"]!.map((x) => CategoryDto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "slug": slug,
        "children":
            children == null ? [] : List<dynamic>.from(children!.map((x) => x)),
      };
}
