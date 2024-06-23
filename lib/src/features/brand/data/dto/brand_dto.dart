class BrandDto {
  final int? id;
  final String? name;
  final String? slug;
  final String? logo;
  final dynamic website;
  final dynamic country;

  const BrandDto({
    this.id,
    this.name,
    this.slug,
    this.logo,
    this.website,
    this.country,
  });

  factory BrandDto.fromJson(Map<String, dynamic> json) => BrandDto(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        logo: json["logo"],
        website: json["website"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "logo": logo,
        "website": website,
        "country": country,
      };
}
