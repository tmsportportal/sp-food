import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';

import '../../../utils/show_snack_helper.dart';
import '../../../widgets/elevated_button_with_state.dart';
import '../controller/login_controller.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final key = GlobalKey<FormState>();

  final controller = GetIt.instance<LoginController>();

  @override
  void dispose() {
    key.currentState?.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      iconPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      icon: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.xmark),
        ),
      ),
      title: Text(
        context.loc.login,
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 5.0),
              //   child: TextField(
              //     maxLength: 8,
              //     inputFormatters: [
              //       FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              //       LengthLimitingTextInputFormatter(8),
              //     ],
              //     decoration: InputDecoration(
              //       labelText: context.loc.phoneNumber,
              //       hintText: '65656565',
              //       prefixText: '+993-',
              //       counter: const SizedBox(),
              //     ),
              //   ),
              // ),
              //  Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10.0),
              //   child: TextField(
              //     maxLength: 4,
              //     inputFormatters: [
              //       FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              //       LengthLimitingTextInputFormatter(4),
              //     ],
              //     decoration: InputDecoration(
              //       labelText: context.loc.otp,
              //       hintText: '1234',
              //       counter: const SizedBox(),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: TextFormField(
                  maxLength: 50,
                  controller: controller.usernameController,
                  validator: (value) =>
                      controller.validateUsername(context.loc.fill),
                  decoration: InputDecoration(
                    labelText: context.loc.username,
                    counter: const SizedBox(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Observer(builder: (context) {
                  return TextFormField(
                    maxLength: 50,
                    controller: controller.passwordController,
                    validator: (value) =>
                        controller.validatePassword(context.loc.fill),
                    obscureText: controller.obscured,
                    decoration: InputDecoration(
                        labelText: context.loc.password,
                        counter: const SizedBox(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.onEyeTapped();
                          },
                          icon: controller.obscured
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined),
                        )),
                  );
                }),
              ),

              Observer(builder: (context) {
                return ElevatedButtonWithState(
                  onPressed: () {
                    controller.login(key, () {
                      Navigator.pop(context);
                      ShowSnackHelper.showSnack(context, SnackStatus.success,
                          context.loc.successfullyLogin);
                    });
                  },
                  isLoading:
                      controller.loginResponse.status == FutureStatus.pending,
                  isError:
                      controller.loginResponse.status == FutureStatus.rejected,
                  child: Text(context.loc.login),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
