import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
import '../../../../../../utils/form_validator/form_validator.dart';
import '../../../../../../utils/show_snack_helper.dart';
import '../../../../../address/controller/address_controller.dart';
import '../../../../../auth/controller/account_status_controller.dart';
import '../../../../../cart/controller/cart_controller.dart';
import '../../../../controller/checkout_controller.dart';
import '../../../../data/dto/checkout_types_dto.dart';
import 'widgets/widgets.dart';

class CheckoutScreenSuccess extends StatefulWidget {
  final CheckoutController checkoutController;
  const CheckoutScreenSuccess({super.key, required this.checkoutController});

  @override
  State<CheckoutScreenSuccess> createState() => CheckoutScreenSuccessState();
}

class CheckoutScreenSuccessState extends State<CheckoutScreenSuccess> {
  late final CheckoutController controller;

  final cartController = GetIt.instance<CartController>();
  final addressController = GetIt.instance<AddressController>();
  final accountStatusController = GetIt.instance<AccountStatusController>();

  final key = GlobalKey<FormState>();

  @override
  void initState() {
    controller = widget.checkoutController;
    super.initState();
  }

  @override
  void dispose() {
    key.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final checkoutTypes = controller.checkoutTypesResponse.value;

      return SliverList(
        delegate: SliverChildListDelegate(
          [
            Builder(builder: (context) {
              return Form(
                key: key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        context.loc.customerInfo,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0),
                      child: TextFormField(
                        validator: ValidationBuilder(
                                localeName: context.loc.localeName)
                            .minLength(2)
                            .build(),
                        controller: controller.fullNameTextController,
                        decoration: InputDecoration(
                          labelText: '${context.loc.fullName}*',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0),
                      child: TextFormField(
                        validator: ValidationBuilder(
                                localeName: context.loc.localeName)
                            .phone()
                            .minLength(12)
                            .maxLength(12)
                            .build(),
                        controller: controller.phoneNumberTextController,
                        decoration: InputDecoration(
                          labelText: '${context.loc.phoneNumber}*',
                        ),
                      ),
                    ),
                    Observer(builder: (context) {
                      if (accountStatusController.accountLoginStatus ==
                          AccountLoginStatus.loggedIn && addressController.addressList.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String?>(
                                decoration: InputDecoration(
                                  labelText: '${context.loc.address}*',
                                ),
                                isExpanded: true,
                                validator: ValidationBuilder(
                                        localeName: context.loc.localeName)
                                    .minLength(2)
                                    .build(),
                                items: [
                                  for (final element
                                      in addressController.addressList)
                                    DropdownMenuItem<String?>(
                                      value: element.address,
                                      child: Text(element.address ?? ""),
                                      onTap: () {},
                                    ),
                                ],
                                value: controller.address,
                                onChanged: (type) {
                                  controller.changeAddress(type);
                                }),
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: '${context.loc.address}*',
                          ),
                          onChanged: (val) {
                            controller.address = val;
                          },
                          validator: ValidationBuilder(
                                  localeName: context.loc.localeName)
                              .minLength(2)
                              .build(),
                        ),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0),
                      child: TextFormField(
                        validator: ValidationBuilder(
                                localeName: context.loc.localeName)
                            .minLength(2)
                            .build(),
                        controller: controller.addressDetailTextController,
                        decoration: InputDecoration(
                          labelText: '${context.loc.addressDetail}*',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0),
                      child: TextFormField(
                        validator: ValidationBuilder(
                                localeName: context.loc.localeName,
                                optional: true)
                            .minLength(2)
                            .build(),
                        controller: controller.noteTextController,
                        decoration: InputDecoration(
                          labelText: context.loc.note,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    FormField<int?>(
                      initialValue: controller.payment,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) {
                        if (val == null) {
                          return context.loc.choosePaymentType;
                        }
                        return null;
                      },
                      builder: (state) {
                        return PaymentTypeWidget(
                          onChanged: (type) {
                            state.didChange(type);
                            controller.changePaymentType(type);
                          },
                          payments: checkoutTypes?.payment ?? <Payment>[],
                          groupValue: controller.payment,
                          hasError: state.hasError,
                          errorText: state.errorText,
                        );
                      },
                    ),
                    FormField<Delivery?>(
                      initialValue: controller.delivery,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) {
                        if (val == null) {
                          return context.loc.chooseDeliveryType;
                        }
                        return null;
                      },
                      builder: (state) {
                        return DeliveryTypeWidget(
                          deliveryTypes:
                              checkoutTypes?.delivery ?? <Delivery>[],
                          onChanged: (Delivery? type) {
                            state.didChange(type);
                            controller.changeDeliveryType(type);
                          },
                          hasError: state.hasError,
                          groupValue: controller.delivery,
                          errorText: state.errorText,
                        );
                      },
                    ),
                  ],
                ),
              );
            }),
            Observer(builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CheckoutTotalContainer(
                  total: cartController.total ?? 0.0,
                  delivery: controller.delivery?.price ?? 0.0,
                  status: controller.checkoutResponse.status,
                  onCheckoutTap: () {
                    controller.checkout(
                      key.currentState?.validate() ?? false,
                      successCallback: () {
                        ShowSnackHelper.showSnack(context, SnackStatus.success,
                            context.loc.orderSuccess);
                      },
                      errorCallback: () {
                        ShowSnackHelper.showSnack(
                            context, SnackStatus.error, context.loc.orderError);
                      },
                    );
                  },
                ),
              );
            }),
          ],
        ),
      );
    });
  }
}
