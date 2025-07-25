import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/ui/themes/theme_text.dart';

class TitleBasic extends StatelessWidget {
  const TitleBasic({
    super.key,
    required this.title,
    this.desc,
    this.size = 'medium',
    this.align
  });

  final String title;
  final String size;
  final String? desc;
  final CrossAxisAlignment? align;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align ?? CrossAxisAlignment.start,
      children: [
        Text(title, style: size == 'medium' ? ThemeText.subtitle : ThemeText.subtitle2),
        const SizedBox(height: 4),
        desc != null ? Text(desc!, overflow: TextOverflow.ellipsis) : Container(),
      ],
    );
  }
}

class TitleBasicSmall extends StatelessWidget {
  const TitleBasicSmall({
    super.key,
    required this.title,
    this.desc,
    this.align
  });

  final String title;
  final String? desc;
  final CrossAxisAlignment? align;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align ?? CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: ThemeText.headline),
        desc != null ? const SizedBox(height: 4) : Container(),
        desc != null ? Text(desc!, overflow: TextOverflow.ellipsis) : Container(),
      ],
    );
  }
}

class TitleBasicSeparator extends StatelessWidget {
  const TitleBasicSeparator({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: spacingUnit(2)),
      decoration: BoxDecoration(
        color: colorScheme(context).surfaceDim
      ),
      child: TitleBasicSmall(title: title)
    );
  }
}