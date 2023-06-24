import 'package:data_art_task/utils/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gap/gap.dart';
import 'package:redux/redux.dart';

import '../../../store/store.dart';
import '../../../utils/app_colors.dart';

class PasswordCheck extends StatelessWidget {
  final bool Function(String) check;
  final String checkDescription;

  const PasswordCheck({
    super.key,
    required this.check,
    required this.checkDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StoreConnector<AppState, Color>(
          converter: (Store<AppState> store) {
            return check(store.state.authorizationModel.password)
                ? AppColors.positive
                : AppColors.secondary;
          },
          builder: (BuildContext context, Color color) {
            return Icon(
              Icons.check_circle_outline,
              color: color,
              size: 30,
            );
          },
        ),
        const Gap(16),
        Expanded(
          child: Text(
            checkDescription.tr(),
            style: context.theme.secondaryText,
            maxLines: null,
          ),
        )
      ],
    );
  }
}
