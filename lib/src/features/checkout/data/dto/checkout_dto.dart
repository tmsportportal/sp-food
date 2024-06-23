class CheckoutDto {
    final int? basket;
    final int? payment;
    final String? fullName;
    final String? phoneNumber;
    final String? address;
    final String? addressDetail;
    final String? note;
    final int? delivery;

    const CheckoutDto({
        this.basket,
        this.payment,
        this.fullName,
        this.phoneNumber,
        this.address,
        this.addressDetail,
        this.note,
        this.delivery,
    });

    factory CheckoutDto.fromJson(Map<String, dynamic> json) => CheckoutDto(
        basket: json["basket"],
        payment: json["payment"],
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        addressDetail: json["address_detail"],
        note: json["note"],
        delivery: json["delivery"],
    );

    Map<String, dynamic> toJson() => {
        "basket": basket,
        "payment": payment,
        "full_name": fullName,
        "phone_number": phoneNumber,
        "address": address,
        "address_detail": addressDetail,
        "note": note,
        "delivery": delivery,
    };
}
