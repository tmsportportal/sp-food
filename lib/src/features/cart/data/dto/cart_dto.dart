import 'cart_product_dto.dart';

class CartDto {
  final int? id;
  final dynamic user;
  final String? uuid;
  final String? totalPrice;
  final List<CartProductDto>? items;

  const CartDto({
    this.id,
    this.user,
    this.uuid,
    this.totalPrice,
    this.items,
  });

  factory CartDto.fromJson(Map<String, dynamic> json) => CartDto(
        id: json["id"],
        user: json["user"],
        uuid: json["uuid"],
        totalPrice: json["total_price"],
        items: json["items"] == null
            ? []
            : List<CartProductDto>.from(
                json["items"]!.map((x) => CartProductDto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "uuid": uuid,
        "total_price": totalPrice,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}
