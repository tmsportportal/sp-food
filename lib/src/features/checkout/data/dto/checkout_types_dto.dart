class CheckoutTypesDto {
  final List<Payment>? payment;
  final List<Delivery>? delivery;

  CheckoutTypesDto({
    this.payment,
    this.delivery,
  });

  factory CheckoutTypesDto.fromJson(Map<String, dynamic> json) =>
      CheckoutTypesDto(
        payment: json["payment"] == null
            ? []
            : List<Payment>.from(
                json["payment"]!.map((x) => Payment.fromJson(x))),
        delivery: json["delivery"] == null
            ? []
            : List<Delivery>.from(
                json["delivery"]!.map((x) => Delivery.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "payment": payment == null
            ? []
            : List<dynamic>.from(payment!.map((x) => x.toJson())),
        "delivery": delivery == null
            ? []
            : List<dynamic>.from(delivery!.map((x) => x.toJson())),
      };
}

class Delivery {
  final int? id;
  final String? type;
  final double? price;

  Delivery({
    this.id,
    this.type,
    this.price,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        id: json["id"],
        type: json["type"],
        price: _parseDouble(json["price"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "price": price,
      };

  static double? _parseDouble(dynamic val) {
    if (val == null) {
      return 0.0;
    }
    if (val is String) {
      return double.tryParse(val);
    }
    if (val is int) {
      return val.toDouble();
    }
    if (val is double) {
      return val;
    }
    return 0.0;
  }
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
