import 'package:auto_route/auto_route.dart';
import 'package:data_art_task/utils/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gap/gap.dart';
import 'package:redux/redux.dart';

import '../../routes/app_router.dart';
import '../../store/authorization/authorization_actions.dart';
import '../../store/store.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_primary_button.dart';
import '../../widgets/custom_text_field.dart';

@RoutePage()
class AuthorizationEmailPage extends StatelessWidget {
  const AuthorizationEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onEmailUpdate(newValue) {
      store.dispatch(UpdateEmailAction(newValue));
    }

    void onEmailSubmit() {
      store.dispatch(
        SubmitEmailAction(
          () {
            //onComplete
            router.push(
              store.state.authorizationModel.userExists
                  ? const AuthorizationPasswordRoute()
                  : const AuthorizationCreatePasswordRoute(),
            );
          },
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          titleText: 'keyWords.transactionManager'.tr(),
        ),
        backgroundColor: AppColors.background,
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Text(
                'authorization.enterYourEmail'.tr(),
                style: context.theme.primaryText,
                textAlign: TextAlign.center,
              ),
              const Gap(16),
              CustomTextField(
                onChange: onEmailUpdate,
                hint: 'authorization.email'.tr(),
              ),
              const Gap(16),
              StoreConnector<AppState, VoidCallback?>(
                converter: (Store<AppState> store) {
                  return store.state.authorizationModel.email.isNotEmpty
                      ? onEmailSubmit
                      : null;
                },
                builder: (BuildContext context, VoidCallback? onPressed) {
                  return CustomPrimaryButton(
                    onPressed: onPressed,
                    text: 'keyWords.continue',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
