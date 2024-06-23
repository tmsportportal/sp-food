import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:sportportal_food/src/widgets/custom_error_widget.dart';

import '../../../../core/navigation/app_routes.dart';
import '../../../account_info/controller/account_info_controller.dart';

class AccountInfoWidget extends StatefulWidget {
  const AccountInfoWidget({super.key});

  @override
  State<AccountInfoWidget> createState() => _AccountInfoWidgetState();
}

class _AccountInfoWidgetState extends State<AccountInfoWidget> {
  final accountInfoController = GetIt.instance<AccountInfoController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(25.0),
      color: theme.colorScheme.surface,
      child: Observer(builder: (context) {
        if (accountInfoController.isError) {
          return Center(
            child: CustomErrorWidget(onPressed: () {
              accountInfoController.fetchAccountInfo();
            }),
          );
        }
        if (accountInfoController.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  maxRadius: 40.0,
                  child: Icon(CupertinoIcons.person),
                ),
                const SizedBox(width: 15.0),
                if (accountInfoController.accountInfo?.firstName != null &&
                    (accountInfoController.accountInfo?.firstName.isNotEmpty ??
                        false))
                  Expanded(
                    child: Text(
                      '${accountInfoController.accountInfo?.firstName} ${accountInfoController.accountInfo?.lastName}',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: Text(
                      'Tell about yourself! using icon in the right side',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                IconButton(
                  onPressed: () {
                    context.goNamed(AppRoutes.accountInfo.name);
                  },
                  icon: const Icon(CupertinoIcons.pencil_outline),
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            if (accountInfoController.accountInfo?.phoneNumber != null &&
                (accountInfoController.accountInfo?.phoneNumber?.isNotEmpty ??
                    false))
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.phone,
                      color: theme.colorScheme.secondary,
                      size: 19.0,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      '${accountInfoController.accountInfo?.phoneNumber}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.secondary,
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
              ),
            if (accountInfoController.accountInfo?.email != null &&
                (accountInfoController.accountInfo?.email?.isNotEmpty ?? false))
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.mail,
                      color: theme.colorScheme.secondary,
                      size: 19.0,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      '${accountInfoController.accountInfo?.email}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.secondary,
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
              ),
          ],
        );
      }),
    );
  }
}
