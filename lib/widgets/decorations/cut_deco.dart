import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/widgets/decorations/dashed_border.dart';

class CutDeco extends StatelessWidget {
  const CutDeco({super.key, this.color, this.radius = 12, this.borderColor});

  final Color? color;
  final Color? borderColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        _cutDeco(context, false),
        Expanded(child: DashedBorder(color: borderColor )),
        _cutDeco(context, true),
      ],),
    );
  }

  Widget _cutDeco(BuildContext context, bool isLast) {
    final Color cardColor = colorScheme(context).outline;

    return Container(
      width: radius / 2,
      height: radius,
      decoration: BoxDecoration(
        color: color != null ? color! : colorScheme(context).surfaceContainerLowest,
        border: Border(
          top: BorderSide(color: borderColor ?? cardColor, width: 1),
          bottom: BorderSide(color: borderColor ?? cardColor, width: 1),
          right: BorderSide(color: borderColor ?? cardColor, width: 1, style: isLast ? BorderStyle.none : BorderStyle.solid),
          left: BorderSide(color: borderColor ?? cardColor, width: 1, style: isLast ? BorderStyle.solid : BorderStyle.none),
          
        ),
        borderRadius: BorderRadius.only(
          topRight: isLast ? const Radius.circular(0) : Radius.circular(radius),
          bottomRight: isLast ? const Radius.circular(0) : Radius.circular(radius),
          topLeft: isLast ? Radius.circular(radius) : const Radius.circular(0),
          bottomLeft: isLast ? Radius.circular(radius) : const Radius.circular(0),
        )
      ),
    );
  }
}
