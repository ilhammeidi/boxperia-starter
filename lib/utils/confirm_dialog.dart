import 'package:booking_app/ui/themes/theme_button.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';

Future<void> confirmDialog(
  BuildContext context, {
    required String title,
    required Widget content,
    String? confirmText,
    String? cancelText,
    required void Function() confirmAction,
  }
) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title, textAlign: TextAlign.center, style: ThemeText.title2,),
        content: Wrap(
          children: [
            Column(children: [
              content,
              VSpace(),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: FilledButton(
                  onPressed: confirmAction,
                  style: ThemeButton.invert(context),
                  child: Text((confirmText ?? 'OK').toUpperCase(), style: ThemeText.paragraphBold,),
                ),
              ),
              SizedBox(height: spacingUnit(1)),
              TextButton(
                style: ThemeButton.invert2(context),
                child: Text((cancelText ?? 'Cancel').toUpperCase(), style: ThemeText.paragraphBold),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ]),
          ],
        ),
      );
    },
  );
}