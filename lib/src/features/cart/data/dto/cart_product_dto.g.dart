// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_dto.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartProductDto on _CartProductDtoBase, Store {
  late final _$quantityAtom =
      Atom(name: '_CartProductDtoBase.quantity', context: context);

  @override
  int? get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int? value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  @override
  String toString() {
    return '''
quantity: ${quantity}
    ''';
  }
}
