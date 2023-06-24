import 'package:data_art_task/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final String titleText;
  CustomAppBar({
    super.key,
    required this.titleText,
    super.automaticallyImplyLeading,
  });

  @override
  Color? get backgroundColor => AppColors.backgroundDim;

  @override
  bool? get centerTitle => true;

  @override
  Widget? get title => Text(
        titleText,
        style: ThemeData().textTheme.displaySmall,
      );

  @override
  double? get elevation => 0.0;
}
