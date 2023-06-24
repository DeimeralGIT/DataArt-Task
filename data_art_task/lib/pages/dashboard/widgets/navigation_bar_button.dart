import 'package:data_art_task/utils/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:redux/redux.dart';

import '../../../store/store.dart';
import '../../../utils/app_colors.dart';

class NavigationBarButton extends StatelessWidget {
  final Function(int) onTap;
  final String title;
  final int index;

  const NavigationBarButton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      converter: (Store<AppState> store) => store.state.pageViewIndex,
      builder: (BuildContext context, int pageViewIndex) {
        return Expanded(
          child: ScaleTap(
            onPressed: () => onTap(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                color: index == pageViewIndex
                    ? AppColors.primary
                    : AppColors.background,
              ),
              child: Text(
                title.tr(),
                style: context.theme.secondaryText,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
