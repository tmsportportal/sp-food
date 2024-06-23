import '../../../product/data/dto/product_list_dto.dart';

import 'package:mobx/mobx.dart';

part 'cart_product_dto.g.dart';

class CartProductDto extends _CartProductDtoBase with _$CartProductDto {
  CartProductDto({
    super.id,
    int super.quantity = 1,
    super.product,
  });

  factory CartProductDto.fromJson(Map<String, dynamic> json) => CartProductDto(
        id: json["id"],
        product: json["product"] == null
            ? null
            : ProductListDto.fromJson(json["product"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product?.toJson(),
        "quantity": quantity,
      };
}

abstract class _CartProductDtoBase with Store {
  final int? id;
  final ProductListDto? product;

  @observable
  int? quantity = 1;

  _CartProductDtoBase({
    this.id,
    this.product,
    this.quantity,
  });
}
