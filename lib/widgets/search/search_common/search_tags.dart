import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';

class TagHistory extends StatelessWidget {
  const TagHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final List tagsList = ['Tokyo', 'Bandung', 'Singapore', 'London', 'Mecca'];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Search History', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: spacingUnit(1)),
          Wrap(alignment: WrapAlignment.start, children: 
            tagsList.map((item) => InkWell(
              onTap: () {},
              child: Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: ThemeRadius.big,
                    color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5)
                  ),
                  child: Text(item),
                ),
            )).toList()
          )
        ],
      ),
    );
  }
}

class TagTrending extends StatelessWidget {
  const TagTrending({super.key});

  @override
  Widget build(BuildContext context) {
    final List tagsList = ['New York', 'London', 'Jakarta', 'Singapore', 'Beijing'];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Trending Search', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: spacingUnit(1)),
          Wrap(alignment: WrapAlignment.start, children: 
            tagsList.map((item) => InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: ThemeRadius.big,
                  border: Border.all(color: colorScheme(context).outline, width: 1),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.trending_up, color: colorScheme(context).onPrimaryContainer),
                  const SizedBox(width: 2),
                  
                  Text(item, style: ThemeText.paragraph)
                ]),
              ),
            )
            ).toList()
          )
        ],
      ),
    );
  }
}