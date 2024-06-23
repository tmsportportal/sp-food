import '../../../brand/data/dto/brand_dto.dart';

class ProductDetailDto {
  final int? id;
  final String? sku;
  final String? upc;
  final String? slug;
  final double? stockQuantity;
  final BrandDto? brand;
  final List<String>? images;
  final String? price;
  final String? discountPercent;
  final bool? isPublic;
  final bool? isFeatured;
  final bool? isOriginal;
  final bool? isNew;
  final String? rating;
  final String? categorySlug;
  final String? subcategorySlug;
  final String? name;
  final String? description;

  ProductDetailDto({
    this.id,
    this.sku,
    this.upc,
    this.slug,
    this.stockQuantity,
    this.brand,
    this.images,
    this.price,
    this.discountPercent,
    this.isPublic,
    this.isFeatured,
    this.isOriginal,
    this.isNew,
    this.rating,
    this.categorySlug,
    this.subcategorySlug,
    this.name,
    this.description,
  });

  factory ProductDetailDto.fromJson(Map<String, dynamic> json) =>
      ProductDetailDto(
        id: json["id"],
        sku: json["sku"],
        upc: json["upc"],
        slug: json["slug"],
        stockQuantity: json["stock_quantity"]?.toDouble(),
        brand: json["brand"] == null ? null : BrandDto.fromJson(json["brand"]),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        price: json["price"],
        discountPercent: json["discount_percent"],
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
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
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
}
