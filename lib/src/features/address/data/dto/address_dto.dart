import 'package:mobx/mobx.dart';

part 'address_dto.g.dart';

class AddressDto extends _AddressDtoBase with _$AddressDto {
  AddressDto({super.address, super.id});

  factory AddressDto.fromJson(Map<String, dynamic> json) => AddressDto(
        address: json["address"],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
      };
}

abstract class _AddressDtoBase with Store {
  final int? id;
  @observable
  String? address;

  _AddressDtoBase({this.id, this.address});
}
