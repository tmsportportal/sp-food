import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
import 'package:sportportal_food/src/features/address/controller/address_controller.dart';
import 'package:sportportal_food/src/utils/consts/app_constants.dart';
import 'package:sportportal_food/src/utils/show_snack_helper.dart';

import '../../../widgets/custom_error_widget.dart';
import 'widgets/add_new_address_bottom_sheet.dart';
import 'widgets/address_item_widget.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final controller = GetIt.instance<AddressController>();

  @override
  void initState() {
    controller.getCurrentMainAddress();
    controller.fetchAddresses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(context.loc.addresses),
            floating: true,
          ),
          Observer(
            builder: (context) {
              if (controller.addressesResponse.status == FutureStatus.pending) {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (controller.addressesResponse.status ==
                  FutureStatus.rejected) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CustomErrorWidget(
                      onPressed: () {
                        controller.fetchAddresses();
                      },
                    ),
                  ),
                );
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final address = controller.addressList[index];
                    return Observer(builder: (context) {
                      return AddressItemWidget(
                        index: index,
                        address: address.address ?? '',
                        currentAddress: controller.currentAddress ?? '',
                        onOptionsTap: () async {
                          controller.deleteAddress(address.id ?? 0, () {
                            ShowSnackHelper.showSnack(context,
                                SnackStatus.success, context.loc.success);
                          }, () {
                            ShowSnackHelper.showSnack(
                                context, SnackStatus.error, context.loc.error);
                          });
                          // await showModalBottomSheet(
                          //   context: context,
                          //   builder: (context) => AddressOptionsBottomSheet(
                          //     onSaveTap: (val) {
                          //       controller.changeAddress(address.id ?? 0, val);
                          //       Navigator.pop(context);
                          //     },
                          //     address: address.address ?? '',
                          //     onDeleteTap: () {
                          //       controller.deleteAddress(address.id ?? 0, () {
                          //         ShowSnackHelper.showSnack(context,
                          //             SnackStatus.success, context.loc.success);
                          //       }, () {
                          //         ShowSnackHelper.showSnack(context,
                          //             SnackStatus.error, context.loc.error);
                          //       });
                          //       Navigator.pop(context);
                          //     },
                          //   ),
                          // );
                        },
                        onChangeMainAddressTap: (val) {
                          controller.changeCurrentAddress(
                            val ?? '',
                            () {
                              ShowSnackHelper.showSnack(
                                  context,
                                  SnackStatus.success,
                                  context.loc.addressSetAsMain);
                            },
                            () {
                              ShowSnackHelper.showSnack(
                                  context,
                                  SnackStatus.error,
                                  context.loc.errorAddressSetAsMain);
                            },
                          );
                        },
                      );
                    });
                  },
                  childCount: controller.addressList.length,
                ),
              );
            },
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: AppConstants.elevatedButtonHeight,
                child: TextButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Observer(builder: (context) {
                        return AddNewAddressBottomSheet(
                          onSaveTap: (val) {
                            controller.postAddress(
                              val,
                              () {
                                Navigator.pop(context);
                                ShowSnackHelper.showSnack(context,
                                    SnackStatus.success, 'newAddressAdded');
                              },
                              () {},
                            );
                          },
                          isError: controller.postAddressResponse.status ==
                              FutureStatus.rejected,
                          isLoading: controller.postAddressResponse.status ==
                              FutureStatus.pending,
                        );
                      }),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: Text(context.loc.addAddress),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
