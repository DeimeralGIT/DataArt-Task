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
import '../../widgets/custom_dialog.dart';
import '../../widgets/custom_primary_button.dart';
import '../../widgets/custom_text_field.dart';
import 'widgets/obscure_widget.dart';

@RoutePage()
class AuthorizationPasswordPage extends StatelessWidget {
  const AuthorizationPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onPasswordUpdate(newValue) {
      store.dispatch(UpdatePasswordAction(newValue));
    }

    void onObscure() => store.dispatch(ObscurePasswordAction());

    void onPasswordSubmit() {
      store.dispatch(
        SubmitPasswordAction(
          (String error) =>
              //onComplete
              error.isEmpty
                  ? router.pushAndPopUntil(
                      DashboardRoute(),
                      predicate: (route) => route.isFirst,
                    )
                  : showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          title: 'keyWords.somethingWentWrong',
                          content: error,
                        );
                      },
                    ),
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
                'authorization.userExists'.tr(),
                style: context.theme.primaryText,
                textAlign: TextAlign.center,
              ),
              const Gap(16),
              StoreConnector<AppState, bool>(
                converter: (Store<AppState> store) =>
                    store.state.authorizationModel.isObscure,
                builder: (BuildContext context, bool isObscure) {
                  return CustomTextField(
                    onChange: onPasswordUpdate,
                    hint: 'authorization.password'.tr(),
                    isObscure: isObscure,
                    suffix: ObscureWidget(
                      onObscure: onObscure,
                    ),
                  );
                },
              ),
              const Gap(16),
              StoreConnector<AppState, VoidCallback?>(
                converter: (Store<AppState> store) {
                  return store.state.authorizationModel.password.length >= 8
                      ? onPasswordSubmit
                      : null;
                },
                builder: (BuildContext context, VoidCallback? onPressed) {
                  return CustomPrimaryButton(
                    onPressed: onPressed,
                    text: 'authorization.signIn',
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
