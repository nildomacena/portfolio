import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:portfolio/home/home_controller.dart';
import 'package:portfolio/home/widgets/projeto/card_projeto.dart';
import 'package:portfolio/responsive.dart';

class ListaProjetos extends StatelessWidget {
  const ListaProjetos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                                                      duration: const Duration(
                                                          milliseconds: 1500),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          _.onSelectProjeto(_
                                                              .projetos[index]);
                                                        },
                                                        child: MouseRegion(
                                                          cursor:
                                                              SystemMouseCursors
                                                                  .click,
                                                          child: CardProjeto(
                                                              height: Responsive
                                                                      .isDesktop()
                                                                  ? (Get.width /
                                                                          _.projetos
                                                                              .length) -
                                                                      (_.projetos.length *
                                                                          20)
                                                                  : 200,
                                                              width: Responsive.isDesktop()
                                                                  ? (Get.width /
                                                                          _.projetos
                                                                              .length) -
                                                                      (_.projetos.length *
                                                                          20)
                                                                  : 200,
                                                              projeto: _
                                                                  .projetos[index]),
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
}
