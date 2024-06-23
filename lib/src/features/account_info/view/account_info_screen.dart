import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
import 'package:sportportal_food/src/features/account_info/controller/account_info_controller.dart';
import 'package:sportportal_food/src/utils/form_validator/form_validator.dart';
import 'package:sportportal_food/src/utils/show_snack_helper.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({super.key});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  final accountInfoController = GetIt.instance<AccountInfoController>();
  final key = GlobalKey<FormState>();

  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final phoneNumberTextController = TextEditingController();
  final emailTextController = TextEditingController();

  @override
  void initState() {
    initControllers();
    super.initState();
  }

  void initControllers() {
    final accountInfo = accountInfoController.accountInfo;
    if (accountInfo != null) {
      firstNameTextController.text = accountInfo.firstName;
      lastNameTextController.text = accountInfo.lastName;
      phoneNumberTextController.text = accountInfo.phoneNumber ?? '';
      emailTextController.text = accountInfo.email ?? '';
    }
  }

  @override
  void dispose() {
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    phoneNumberTextController.dispose();
    emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(context.loc.accountInfo),
          ),
          SliverToBoxAdapter(
            child: Form(
              key: key,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    child: TextFormField(
                      controller: firstNameTextController,
                      validator: ValidationBuilder().minLength(2).build(),
                      decoration: InputDecoration(
                        labelText: '${context.loc.firstName}*',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: TextFormField(
                      controller: lastNameTextController,
                      validator: ValidationBuilder().minLength(2).build(),
                      decoration: InputDecoration(
                        labelText: '${context.loc.lastName}*',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: TextFormField(
                      controller: phoneNumberTextController,
                      validator: ValidationBuilder()
                          .phone()
                          .minLength(12)
                          .maxLength(12)
                          .build(),
                      decoration: InputDecoration(
                        labelText: '${context.loc.phoneNumber}*',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: TextFormField(
                      controller: emailTextController,
                      validator: ValidationBuilder(optional: true)
                          .email()
                          .maxLength(50)
                          .build(),
                      decoration: InputDecoration(
                        labelText: context.loc.email,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    accountInfoController.updateAccountInfo(
                      key.currentState?.validate() ?? false,
                      firstNameTextController.text,
                      lastNameTextController.text,
                      phoneNumberTextController.text,
                      emailTextController.text,
                      () {
                        ShowSnackHelper.showSnack(context, SnackStatus.success,
                            context.loc.successfullySaved);
                      },
                      (e) {
                        ShowSnackHelper.showSnack(
                            context, SnackStatus.error, context.loc.error);
                      },
                    );
                  },
                  child: Text(context.loc.save),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
