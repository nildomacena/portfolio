import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/zocial_icons.dart';
import 'package:get/get.dart';
import 'package:portfolio/home/home_controller.dart';
import 'package:portfolio/home/widgets/projeto/card_projeto.dart';
import 'package:portfolio/home/widgets/contato/container_contato.dart';
import 'package:portfolio/home/widgets/projeto/container_projeto.dart';
import 'package:portfolio/home/widgets/sobre/sobre.dart';
import 'package:portfolio/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  HomePage({Key? key}) : super(key: key);
  final double appBarHeight = 100;

  @override
  Widget build(BuildContext context) {
    double tamanhoFonte = Responsive.isDesktop() ? 30 : 18;

    Widget listaProjetos(BuildContext context) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Container(
              //padding: const EdgeInsets.only(bottom: 30),
              width: Get.width,
              height: 600,
              //color: Colors.grey[200],
              child: GetBuilder<HomeController>(
                builder: (_) {
                  if (_.projetos.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return FutureBuilder<dynamic>(
                      future: _.promisePreCache(context),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          case ConnectionState.done:
                          default:
                            return AnimationLimiter(
                                child: Center(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _.projetosAux.length,
                                  itemBuilder: (context, index) {
                                    return AnimationConfiguration.staggeredList(
                                        position: index,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        child: SlideAnimation(
                                            //verticalOffset: 50.0,
                                            child: FadeInAnimation(
                                                child: AnimationConfiguration
                                                    .staggeredList(
                                                        position: index,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    1500),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            _.onSelectProjeto(
                                                                _.projetosAux[
                                                                    index]);
                                                          },
                                                          child: MouseRegion(
                                                            cursor:
                                                                SystemMouseCursors
                                                                    .click,
                                                            child: CardProjeto(
                                                                height: Responsive
                                                                        .isDesktop()
                                                                    ? (Get.width / _.projetosAux.length) -
                                                                        (_.projetosAux.length *
                                                                            20)
                                                                    : 200,
                                                                width: Responsive
                                                                        .isDesktop()
                                                                    ? (Get.width / _.projetosAux.length) -
                                                                        (_.projetosAux.length *
                                                                            20)
                                                                    : 200,
                                                                projeto:
                                                                    _.projetosAux[
                                                                        index]),
                                                          ),
                                                        )))));
                                  }),
                            ));
                        }
                      });
                },
              )),
        ],
      );
    }

    return Scaffold(
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            GetBuilder<HomeController>(
              builder: (_) {
                return ListView(
                  controller: _.scrollController,
                  shrinkWrap: true,
                  children: [
                    const SobreContainer(),
                    ContainerContato(),
                    if (_.projetoSelecionado != null) ...{
                      ContainerProjeto(_.projetoSelecionado!)
                    },
                    if (_.projetos.isNotEmpty) ...{
                      Column(
                        children: [
                          Container(
                            width: Get.width,
                            margin: const EdgeInsets.only(top: 60),
                            alignment: Alignment.center,
                            child: const Text(
                              'UM POUCO DO MEU TRABALHO',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          AnimationLimiter(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _.projetos.length,
                                itemBuilder: (context, index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    child: SlideAnimation(
                                      child: FadeInAnimation(
                                        child: ContainerProjeto(
                                          _.projetos[index],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      )
                    }
                  ],
                );
              },
            ),
            Positioned(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Entypo.github),
                    onPressed: () {
                      window.open(' https://github.com/nildomacena/',
                          'Github Ednildo Macena');
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    icon: const Icon(Entypo.linkedin),
                    onPressed: () {
                      window.open('https://www.linkedin.com/in/ednildo-macena/',
                          'LinkedIn Ednildo Macena');
                    },
                  ),
                ],
              ),
              top: 10,
              right: 10,
            )
          ],
        ),
      ),
    );
  }
}
