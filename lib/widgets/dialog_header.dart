import 'package:flutter/material.dart';
import 'package:smartlink/i18n.dart';
import 'package:smartlink/theme.dart';
import 'package:smartlink/widgets/icon_action.dart';

class DialogHeader extends StatelessWidget {
    const DialogHeader({
        required this.title,
        super.key,
        this.icon,
        this.actions = const []
    });
    final String title;
    final IconData? icon;

    final List<Widget> actions;

    @override
    Widget build(BuildContext context) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Row(
                    spacing: 8,
                    children: [
                        if (icon != null) Icon(icon),
                        Text(title, style: const TextStyle(fontWeight: FontWeight.w600))
                    ]
                ),
                Row(
                    spacing: 2,
                    children: [
                        ...actions,
                        IconAction(
                            tooltip: t.common.close_dialog,
                            icon: Icons.close,
                            color: AppColors.error,
                            on_pressed: () => Navigator.pop(context)
                        )
                    ]
                )
            ]
        );
    }
}
