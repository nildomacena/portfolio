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
                                  itemCount: _.projetos.length,
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
                                                                _.projetos[
                                                                    index]);
                                                          },
                                                          child: MouseRegion(
                                                            cursor:
                                                                SystemMouseCursors
                                                                    .click,
                                                            child: CardProjeto(
                                                                height: Responsive
                                                                        .isDesktop()
                                                                    ? (Get.width / _.projetos.length) -
                                                                        (_.projetos.length *
                                                                            20)
                                                                    : 200,
                                                                width: Responsive
                                                                        .isDesktop()
                                                                    ? (Get.width / _.projetos.length) -
                                                                        (_.projetos.length *
                                                                            20)
                                                                    : 200,
                                                                projeto:
                                                                    _.projetos[
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

    Widget sobre(BuildContext context) {
      TextStyle style =
          GoogleFonts.lato(textStyle: TextStyle(fontSize: tamanhoFonte));
      return SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: Get.width,
              margin: const EdgeInsets.only(bottom: 30),
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                margin: EdgeInsets.only(top: Responsive.isMobile() ? 10 : 50),
                height:
                    Responsive.isDesktop() || Responsive.isTablet() ? 200 : 100,
                width:
                    Responsive.isDesktop() || Responsive.isTablet() ? 200 : 100,
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/iacs-c71ce.appspot.com/o/eu.jpeg?alt=media&token=e6ea57d9-f643-47fd-84b0-fd27e49c21f1',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Get.width,
              child: Text(
                'Olá, sou Ednildo Macena',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: tamanhoFonte, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
                width: Get.width,
                margin: const EdgeInsets.only(top: 5, left: 30),
                child: Text(
                  'Sou desenvolvedor há 10 anos. Buscar resolver problemas é aquilo que me move!',
                  textAlign: TextAlign.center,
                  style: style,
                )),
            Container(
              width: Get.width,
              margin: EdgeInsets.only(
                  top: 5,
                  bottom: 20,
                  left: Responsive.isMobile() ? 20 : 100,
                  right: Responsive.isMobile() ? 20 : 100),
              child: Text(
                'Tenho alguns projetos desenvolvidos e em produção. Em sua maioria são aplicativos mobile desenvolvidos em Flutter e sistemas Web utilizando o framework Angular.\nFique à vontade para conferir abaixo alguns deles',
                textAlign: TextAlign.center,
                style: style,
              ),
            ),
            /* Expanded(child: Container()), */
            Expanded(
                child: Container(
                    //padding: const EdgeInsets.only(bottom: 20),
                    child: listaProjetos(context)))
          ],
        ),
      );
    }

    Widget contato() {
      return SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: const Text(
                'Me envie uma mensagem',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: Responsive.isMobile() ? Get.width : 1000,
              padding: const EdgeInsets.only(left: 30, right: 30),
              height: 260,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: const [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Seu nome',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)))),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Contato',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: const TextField(
                      minLines: 5,
                      maxLines: 5,
                      decoration: InputDecoration(
                          hintText: 'Mensagem',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)))),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    alignment: Alignment.centerRight,
                    width: Responsive.isMobile() ? Get.width : 1000,
                    child: SizedBox(
                      height: Responsive.isMobile() ? 45 : 55,
                      width: Responsive.isMobile() ? Get.width : 400,
                      child: ElevatedButton(
                        child: const Text('ENVIAR MENSAGEM'),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 10),
              child:
                  const Text('Portfólio desenvolvido utilizando Flutter Web'),
            )
          ],
        ),
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
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _.projetos.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ContainerProjeto(
                                      _.projetos[index],
                                    ),
                                  ],
                                );
                              })
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
