import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/widgets/app_button/back_icon_button.dart';
import 'package:booking_app/widgets/cta_product/notfound_starter.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Found', style: ThemeText.subtitle),
        leading: BackIconButton(onTap: () {
          Get.back();
        }),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: NotfoundStarter(),
    );
  }
}