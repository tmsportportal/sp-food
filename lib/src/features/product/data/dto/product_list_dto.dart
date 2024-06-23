import '../../../brand/data/dto/brand_dto.dart';

class ProductListDto {
  final int? id;
  final String? sku;
  final String? upc;
  final String? slug;
  final double? stockQuantity;
  final BrandDto? brand;
  final String? thumbnail;
  final double? price;
  final double? discountPercent;
  final bool? isPublic;
  final bool? isFeatured;
  final bool? isOriginal;
  final bool? isNew;
  final String? rating;
  final String? categorySlug;
  final String? subcategorySlug;
  final String? name;
  final String? description;

  const ProductListDto({
    this.id,
    this.sku,
    this.upc,
    this.slug,
    this.rating,
    this.categorySlug,
    this.subcategorySlug,
    this.name,
    this.description,
    this.thumbnail,
    this.brand,
    this.stockQuantity,
    this.price,
    this.discountPercent,
    this.isPublic,
    this.isFeatured,
    this.isOriginal,
    this.isNew,
  });

  factory ProductListDto.fromJson(Map<String, dynamic> json) => ProductListDto(
        id: json["id"],
        sku: json["sku"],
        upc: json["upc"],
        slug: json["slug"],
        stockQuantity: json["stock_quantity"]?.toDouble(),
        brand: json["brand"] == null ? null : BrandDto.fromJson(json["brand"]),
        thumbnail: json["thumbnail"],
        price: _parseDouble(json["price"]),
        discountPercent: _parseDouble(json["discount_percent"]),
        isPublic: json["is_public"],
        isFeatured: json["is_featured"],
        isOriginal: json["is_original"],
        isNew: json["is_new"],
        rating: json["rating"],
        categorySlug: json["category_slug"],
        subcategorySlug: json["subcategory_slug"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sku": sku,
        "upc": upc,
        "slug": slug,
        "stock_quantity": stockQuantity,
        "brand": brand?.toJson(),
        "thumbnail": thumbnail,
        "price": price,
        "discount_percent": discountPercent,
        "is_public": isPublic,
        "is_featured": isFeatured,
        "is_original": isOriginal,
        "is_new": isNew,
        "rating": rating,
        "category_slug": categorySlug,
        "subcategory_slug": subcategorySlug,
        "name": name,
        "description": description,
      };

  static double? _parseDouble(dynamic value) {
    if (value == null) {
      return null;
    }
    if (value is double) {
      return value;
    }
    if (value is int) {
      return value.toDouble();
    }
    if (value is String) {
      return double.tryParse(value);
    }
    return null;
  }
}
