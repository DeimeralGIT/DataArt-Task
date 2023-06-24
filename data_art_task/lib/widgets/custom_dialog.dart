import 'package:data_art_task/utils/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title.tr(),
        style: context.theme.primaryText,
      ),
      content: Text(
        content.tr(),
        style: context.theme.secondaryText,
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'keyWords.ok'.tr(),
            style: context.theme.primaryText,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
