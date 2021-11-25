import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/home/home_controller.dart';
import 'package:portfolio/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  HomePage({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  final double appBarHeight = 100;

  Widget sobre() {
    TextStyle style =
        GoogleFonts.lato(textStyle: const TextStyle(fontSize: 30));
    return SizedBox(
      width: Get.width,
      height: Get.height - appBarHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 300),
            child: Text(
              'Olá, sou Ednildo Macena',
              textAlign: TextAlign.left,
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
              width: 1100,
              margin: const EdgeInsets.only(top: 5, left: 30),
              child: Text(
                'Sou desenvolvedor há 10 anos. Buscar resolver problemas é aquilo que me move!',
                textAlign: TextAlign.left,
                style: style,
              )),
          Container(
            width: 1100,
            margin: const EdgeInsets.only(top: 5, left: 30),
            child: Text(
              'Tenho alguns projetos desenvolvidos e em produção. Em sua maioria são aplicativos mobile desenvolvidos em Flutter e sistemas Web utilizando o framework Angular. Fique à vontade em conferir alguns deles',
              textAlign: TextAlign.left,
              style: style,
            ),
          ),
          Expanded(child: Container()),
          listaProjetos()
        ],
      ),
    );
  }

  Widget listaProjetos() {
    return Container(
      width: Get.width,
      height: 300,
      color: Colors.grey,
      child: FirestoreAnimatedList(
        query: controller.query,
        itemBuilder: (
          BuildContext context,
          DocumentSnapshot<Object?>? snapshot,
          Animation<double> animation,
          int index,
        ) {
          return FadeTransition(
            opacity: animation,
            child: Text(snapshot!.id),
          );
        },
      ),
    );
  }

/**
 'Widget Function(BuildContext, DocumentSnapshot<Object?>, Animation<double>, int)' can't be assigned to the parameter type 
  Widget Function(BuildContext, DocumentSnapshot<Object?>?, Animation<double>, int)
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: appBarHeight,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Ednildo Macena',
              style: GoogleFonts.lato(textStyle: TextStyle()),
            ),
            Text(
              'Desenvolvimento mobile e web',
              style: GoogleFonts.lato(textStyle: TextStyle()),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                print('projetos');
                _scrollController.animateTo(Get.height - 100,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              child: const Text(
                'PROJETOS',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: ListView(
        controller: _scrollController,
        shrinkWrap: true,
        children: [
          sobre(),
          Container(
            height: Get.height - 100,
            width: Get.width,
            color: Colors.pink,
          ),
          listaProjetos()
        ],
      ),
    );
  }
}
