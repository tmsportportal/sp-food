import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

import '../controller/checkout_controller.dart';
import 'widgets/checkout_screen_error/view/checkout_screen_error.dart';
import 'widgets/checkout_screen_loading/view/checkout_screen_loading.dart';
import 'widgets/checkout_screen_success/view/checkout_screen_success.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final controller = GetIt.instance<CheckoutController>();

  @override
  void initState() {
    controller.initController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(context.loc.checkout),
            floating: true,
          ),
          Observer(
            builder: (context) {
              if (controller.checkoutTypesResponse.status ==
                  FutureStatus.pending) {
                return const CheckoutScreenLoading();
              }
              if (controller.checkoutTypesResponse.status ==
                  FutureStatus.rejected) {
                return CheckoutScreenError(onRetryTap: () {
                  controller.getCheckoutTypes();
                });
              }
              return CheckoutScreenSuccess(
                checkoutController: controller,
              );
            },
          ),
        ],
      ),
    );
  }
}
