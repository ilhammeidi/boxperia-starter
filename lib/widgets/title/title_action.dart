import 'package:flutter/material.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';

class TitleAction extends StatelessWidget {
  const TitleAction({
    super.key,
    required this.title,
    required this.textAction,
    required this.onTap,
    this.desc,
    this.size = 'default'
  });

  final String title;
  final String? desc;
  final String textAction;
  final String size;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: size == 'small' ? ThemeText.subtitle2 : ThemeText.subtitle),
            const SizedBox(height: 4),
            desc != null ? Text(desc!, overflow: TextOverflow.ellipsis,) : Container(),
          ],
        ),
      ),
      SizedBox(width: spacingUnit(2)),
      InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ThemePalette.primaryMain,
                width: 2,
              ),
            ),
          ),  
          child: Text(textAction, textAlign: TextAlign.start, style: ThemeText.paragraph.copyWith(height: 1, fontWeight: FontWeight.w600))
        ),
      )
    ]);
  }
}
