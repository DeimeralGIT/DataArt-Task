import 'package:auto_route/auto_route.dart';
import 'package:data_art_task/utils/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gap/gap.dart';
import 'package:redux/redux.dart';

import '../../constants/regexp.dart';
import '../../routes/app_router.dart';
import '../../store/authorization/authorization_actions.dart';
import '../../store/store.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/custom_primary_button.dart';
import '../../widgets/custom_text_field.dart';
import 'widgets/obscure_widget.dart';
import 'widgets/password_check.dart';

@RoutePage()
class AuthorizationCreatePasswordPage extends StatelessWidget {
  const AuthorizationCreatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onPasswordUpdate(newValue) {
      store.dispatch(UpdatePasswordAction(newValue));
    }

    void onConfirmPasswordUpdate(newValue) {
      store.dispatch(UpdateConfirmPasswordAction(newValue));
    }

    void onObscure() => store.dispatch(ObscurePasswordAction());

    void onPasswordSubmit() {
      store.dispatch(
        SubmitPasswordAction(
          (error) => error.isEmpty
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

    bool passwordValid() {
      final pass = store.state.authorizationModel.password;

      return pass.length >= 8 &&
          pass.contains(numberRegexp) &&
          pass.contains(uppercaseRegexp);
    }

    bool passwordsMatch() {
      final user = store.state.authorizationModel;

      return user.password == user.confirmPassword;
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          titleText: 'keyWords.transactionManager'.tr(),
        ),
        backgroundColor: AppColors.background,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                'authorization.userDoesNotExist'.tr(),
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

              // Password validation checks
              PasswordCheck(
                check: (pass) => pass.length >= 8,
                checkDescription: 'authorization.passwordLength',
              ),
              const Gap(16),
              PasswordCheck(
                check: (pass) => pass.contains(numberRegexp),
                checkDescription: 'authorization.containsNumber',
              ),
              const Gap(16),
              PasswordCheck(
                check: (pass) => pass.contains(uppercaseRegexp),
                checkDescription: 'authorization.containsUppercase',
              ),
              const Gap(16),

              StoreConnector<AppState, bool>(
                converter: (Store<AppState> store) =>
                    store.state.authorizationModel.isObscure,
                builder: (BuildContext context, bool isObscure) {
                  return CustomTextField(
                    onChange: onConfirmPasswordUpdate,
                    hint: 'authorization.confirmPassword'.tr(),
                    isObscure: isObscure,
                  );
                },
              ),
              const Gap(16),

              // check if passwords match
              PasswordCheck(
                check: (pass) =>
                    pass == store.state.authorizationModel.confirmPassword,
                checkDescription: 'authorization.passwordsMatch',
              ),
              const Gap(16),

              StoreConnector<AppState, VoidCallback?>(
                converter: (Store<AppState> store) {
                  return passwordValid() && passwordsMatch()
                      ? onPasswordSubmit
                      : null;
                },
                builder: (BuildContext context, VoidCallback? onPressed) {
                  return CustomPrimaryButton(
                    onPressed: onPressed,
                    text: store.state.authorizationModel.userExists
                        ? 'authorization.signIn'
                        : 'authorization.register',
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
