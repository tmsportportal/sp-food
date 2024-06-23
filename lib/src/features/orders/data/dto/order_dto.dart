import 'package:sportportal_food/src/features/product/data/dto/product_list_dto.dart';

class OrderDto {
  final int? id;
  final Basket? basket;
  final Payment? payment;
  final Delivery? delivery;
  final OrderStatus? status;

  const OrderDto({
    this.id,
    this.basket,
    this.payment,
    this.delivery,
    this.status,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) => OrderDto(
        id: json["id"],
        basket: json["basket"] == null ? null : Basket.fromJson(json["basket"]),
        payment:
            json["payment"] == null ? null : Payment.fromJson(json["payment"]),
        delivery: json["delivery"] == null
            ? null
            : Delivery.fromJson(json["delivery"]),
        status: OrderStatus.values.byName(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "basket": basket?.toJson(),
        "payment": payment?.toJson(),
        "delivery": delivery?.toJson(),
        "status": status,
      };
}

class Basket {
  final int? id;
  final List<Item>? items;
  final String? uuid;
  final String? totalPrice;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic user;

  Basket({
    this.id,
    this.items,
    this.uuid,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Basket.fromJson(Map<String, dynamic> json) => Basket(
        id: json["id"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        uuid: json["uuid"],
        totalPrice: json["total_price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "uuid": uuid,
        "total_price": totalPrice,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user,
      };
}

class Item {
  final int? id;
  final ProductListDto? product;
  final int? quantity;
  final String? totalPrice;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? basket;

  Item({
    this.id,
    this.product,
    this.quantity,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this.basket,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        product: json["product"] == null
            ? null
            : ProductListDto.fromJson(json["product"]),
        quantity: json["quantity"],
        totalPrice: json["total_price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        basket: json["basket"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product?.toJson(),
        "quantity": quantity,
        "total_price": totalPrice,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "basket": basket,
      };
}

class Delivery {
  final int? id;
  final String? type;
  final String? price;

  Delivery({
    this.id,
    this.type,
    this.price,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        id: json["id"],
        type: json["type"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "price": price,
      };
}

class Payment {
  final int? id;
  final String? type;

  Payment({
    this.id,
    this.type,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
      };
}

enum OrderStatus {
  pending,
  confirmed,
  canceled,
  delivered,
}
