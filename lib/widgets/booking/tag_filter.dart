import 'package:booking_app/widgets/app_button/tag_button.dart';
import 'package:flutter/material.dart';

final List<String> tagFilter = ['All', 'Hotels', 'Homestays', 'Workspaces'];

class TagFilter extends StatelessWidget {
  const TagFilter({super.key, required this.selected, required this.onPress });

  final String selected;
  final Function(String) onPress;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagFilter.length,
        itemBuilder: (context, index) {
          String item = tagFilter[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 16 : 4,
              right: 4
            ),
            child: TagButton(
              size: BtnSize.big,
              text: item,
              selected: selected == item,
              onPressed: () {
                onPress(item);
              }
            ),
          );
        },
      ),
    );
  }
}