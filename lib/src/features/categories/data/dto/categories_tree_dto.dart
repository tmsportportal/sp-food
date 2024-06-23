class CategoryTreeDto {
  final int? id;
  final int? parentId;
  final String? name;
  final String? thumbnail;
  final List<CategoryTreeDto>? children;

  const CategoryTreeDto({
    this.id,
    this.parentId,
    this.name,
    this.thumbnail,
    this.children,
  });

  factory CategoryTreeDto.fromJson(Map<String, dynamic> json) =>
      CategoryTreeDto(
        id: json["id"],
        parentId: json["parent_id"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        children: json["children"] == null
            ? []
            : List<CategoryTreeDto>.from(
                json["children"]!.map((x) => CategoryTreeDto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "name": name,
        "thumbnail": thumbnail,
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
      };
}
