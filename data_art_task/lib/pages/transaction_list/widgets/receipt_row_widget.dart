import 'package:data_art_task/utils/context_extensions.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class ReceiptRowWidget extends StatelessWidget {
  final String label;
  final String value;
  const ReceiptRowWidget({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label.tr(),
          style: context.theme.secondaryText,
        ),
        const Expanded(
          child: DottedLine(
            direction: Axis.horizontal,
            lineThickness: 1.0,
            dashLength: 4.0,
            dashColor: AppColors.primary,
          ),
        ),
        Text(
          value.tr(),
          style: context.theme.secondaryText,
        ),
      ],
    );
  }
}
