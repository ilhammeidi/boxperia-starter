import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/models/workspace.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/widgets/cards/workspace_card.dart';
import 'package:booking_app/widgets/title/title_action.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class BasicWorkspaceSlider extends StatelessWidget {
  const BasicWorkspaceSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Workspace> nearestWorkspace = workspaceList.sublist(9, 17);
    const double cardHeight = 220;

    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleAction(
          title: 'Workspaces Around You',
          textAction: 'See All',
          onTap: () {
            Get.toNamed(AppLink.workspaceList);
          }
        ),
      ),
      SizedBox(height: spacingUnit(2)),
      SizedBox(
        height: cardHeight,
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: spacingUnit(2)),
          itemCount: nearestWorkspace.length,
          itemBuilder: ((context, index) {
            Workspace item = nearestWorkspace[index];
            return SizedBox(
              width: 180,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppLink.workspaceDetail);
                },
                child: WorkspaceCard(
                  label: 'Best Value',
                  image: item.thumbnail,
                  price: item.price,
                  title: item.name,
                  location: '${item.location.name}, ${item.location.country}',
                  rating: item.rating,
                  reviews: item.reviews,
                ),
              )
            );
          })
        )
      )
    ]);
  }
}