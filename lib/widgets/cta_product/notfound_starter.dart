import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/ui/themes/theme_button.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/route_manager.dart';

class NotfoundStarter extends StatelessWidget {
  const NotfoundStarter({super.key});

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri urlFullVersion = Uri.parse('https://codecanyon.net/user/ilhammeidi/portfolio');

    return Padding(
      padding: EdgeInsets.all(spacingUnit(2)),
      child: Column(
        children: [
          const Text('Screen only available in the Boxperia Full version', style: ThemeText.title2, textAlign: TextAlign.center,),
          const VSpace(),
          ClipRRect(
            borderRadius: ThemeRadius.medium,
            child: Image.asset('assets/images/preview.jpg'),
          ),
          const VSpace(),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                _launchUrl(urlFullVersion);
              },
              style: ThemeButton.btnBig.merge(ThemeButton.invert(context)),
              child: const Text('Get the Full Version', style: ThemeText.subtitle),
            )
          ),
          const VSpace(),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Get.toNamed(AppLink.home);
              },
              style: ThemeButton.btnBig.merge(ThemeButton.outlinedInvert(context)),
              child: const Text('Back to Home', style: ThemeText.subtitle),
            )
          ),
        ],
      ),
    );
  }
}