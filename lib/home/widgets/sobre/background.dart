import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Background extends StatefulWidget {
  const Background({Key? key}) : super(key: key);

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  double altura = 400;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        altura = 120;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: AnimatedContainer(
              transform: Matrix4.translationValues(0.0, altura, 0.0),
              alignment: Alignment.bottomRight,
              duration: const Duration(seconds: 2),
              width: Get.width / 11,
              height: 120,
              child: ExtendedImage.asset(
                'assets/images/mockup-celular.png',
                fit: BoxFit.fitWidth,
                opacity: const AlwaysStoppedAnimation(.4),
              ),
            ),
          )
        ],
      ),
    );
  }
}
