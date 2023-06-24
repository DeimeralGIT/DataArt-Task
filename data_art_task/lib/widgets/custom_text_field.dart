import 'package:data_art_task/utils/context_extensions.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final void Function(String) onChange;
  final String hint;
  final bool isObscure;
  final Widget? suffix;

  const CustomTextField({
    super.key,
    required this.onChange,
    required this.hint,
    this.suffix,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      cursorColor: AppColors.primary,
      style: context.theme.secondaryText,
      obscureText: isObscure,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: suffix,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.secondary,
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        hintText: hint,
      ),
    );
  }
}
