import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

import '../store/store.dart';
import '../utils/app_colors.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool isEnabled;
  final Color? color;
  const CustomPrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isEnabled = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: ScaleTap(
              onPressed: !store.state.isLoading ? onPressed : null,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: onPressed != null
                      ? color ?? AppColors.primary
                      : AppColors.backgroundDim,
                ),
                alignment: Alignment.center,
                height: 65,
                child: store.state.isLoading
                    ? const CircularProgressIndicator(
                        color: AppColors.primaryTextColor,
                      )
                    : Text(
                        text.tr(),
                        style: TextStyle(
                          fontSize: 24,
                          color: onPressed != null
                              ? AppColors.primaryTextColor
                              : AppColors.secondary,
                        ),
                      ),
              ),
            ),
          ),
        ],
      );
}
