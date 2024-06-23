import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
import 'package:sportportal_food/src/features/account_info/controller/account_info_controller.dart';

import '../../../widgets/custom_error_widget.dart';
import '../../auth/controller/account_controller.dart';
import '../../auth/controller/account_status_controller.dart';
import 'widgets/language_change_widget.dart';
import 'widgets/profile_logged_in_widget.dart';
import 'widgets/profile_not_logged_in_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  final accountStatusController = GetIt.instance<AccountStatusController>();
  final accountController = GetIt.instance<AccountController>();
  final accountInfoController = GetIt.instance<AccountInfoController>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton(
            onPressed: () {
              _onLangTapped(context);
            },
            icon: const Icon(CupertinoIcons.globe),
          ),
          title: Text(context.loc.profile),
          // actions: [],
        ),
        Observer(
          builder: (context) {
            final accountStatus = accountStatusController.accountLoginStatus;
            switch (accountStatus) {
              case AccountLoginStatus.empty:
                return const SliverToBoxAdapter(
                  child: ProfileNotLoggedInWidget(),
                );

              case AccountLoginStatus.loading:
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              case AccountLoginStatus.error:
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CustomErrorWidget(
                      onPressed: () {
                        accountController.getAccount();
                      },
                    ),
                  ),
                );

              case AccountLoginStatus.notLoggedIn:
                return const SliverToBoxAdapter(
                  child: ProfileNotLoggedInWidget(),
                );

              case AccountLoginStatus.loggedIn:
                return ProfileLoggedInWidget(
                  onLogoutTap: () {
                    accountController.logout();
                    accountInfoController.accountInfo = null;
                  },
                );
            }
          },
        ),
      ],
    );
  }

  Future<void> _onLangTapped(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return const LanguageChangeWidget();
      },
    );
  }
}
