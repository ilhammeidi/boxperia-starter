import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeneralLayout extends StatelessWidget {
  const GeneralLayout({super.key, required this.content, this.isHome = false});

  final Widget content;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: Theme.of(context).brightness == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1024,
              minHeight: 480
            ),
            child: SafeArea(
              bottom: false,
              top: !isHome,
              child: content
            ),
          ),
        )
      ),
    );
  }
}