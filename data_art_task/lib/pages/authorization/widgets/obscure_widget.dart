import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

import '../../../store/store.dart';
import '../../../utils/app_colors.dart';

class ObscureWidget extends StatelessWidget {
  final Function() onObscure;
  const ObscureWidget({
    super.key,
    required this.onObscure,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: onObscure,
      child: Icon(
        store.state.authorizationModel.isObscure
            ? Icons.visibility_off
            : Icons.visibility,
        size: 25,
        color: AppColors.primaryTextColor,
      ),
    );
  }
}
