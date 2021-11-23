import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive(
      {required this.mobile,
      required this.desktop,
      required this.tablet,
      Key? key})
      : super(key: key);

  static bool isMobile() => Get.width < 650;
  static bool isTablet() => Get.width >= 650 && Get.width < 1100;
  static bool isDesktop() => Get.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        } else if (constraints.maxWidth >= 650) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
