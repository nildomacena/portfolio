import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/zocial_icons.dart';
import 'package:get/get.dart';
import 'package:portfolio/home/home_controller.dart';
import 'package:portfolio/model/projeto.model.dart';
import 'package:portfolio/responsive.dart';

class ContainerProjeto extends StatelessWidget {
  final HomeController controller = Get.find();
  final Projeto projeto;
  ContainerProjeto(this.projeto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile();
    bool isDesktop = Responsive.isDesktop();
    bool isTablet = Responsive.isTablet();
    List<Future> fImagens = [];
    projeto.imagens.forEach((i) async {
      await precacheImage(NetworkImage(i), context);
    });

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const Divider(
          //color: Colors.grey,
          thickness: 1,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: isDesktop
              ? 200
              : isMobile
                  ? 120
                  : 150,
          height: isDesktop
              ? 200
              : isMobile
                  ? 120
                  : 150,
          child: Image.network(projeto.icone),
        ),
        Container(
            margin: const EdgeInsets.only(top: 30),
            width: Get.width,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  projeto.nome,
                  style: TextStyle(
                      fontSize: isDesktop
                          ? 50
                          : isTablet
                              ? 35
                              : 25,
                      fontWeight: FontWeight.bold),
                ),
                if (projeto.link != null)
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      onPressed: () {
                        window.open(projeto.link!, projeto.nome);
                      },
                      icon: Icon(Icons.link, size: isDesktop ? 30 : 20),
                      /*  label: Text(
                        'Link',
                        style: TextStyle(fontSize: isDesktop ? 25 : 16),
                      ) */
                    ),
                  ),
                if (projeto.github != null)
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      onPressed: () {
                        window.open(projeto.github!, projeto.nome);
                      },
                      icon: Icon(Typicons.github, size: isDesktop ? 30 : 20),
                      /*  label: Text(
                        'Link',
                        style: TextStyle(fontSize: isDesktop ? 25 : 16),
                      ) */
                    ),
                  ),
              ],
            )),
        const Divider(
          thickness: 1,
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: EdgeInsets.only(
                left: Responsive.isDesktop() ? 70 : 30,
                right: Responsive.isDesktop() ? 70 : 30),
            width: 800,
            child: Text(
              projeto.subtitulo,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: isDesktop ? 30 : 16, fontWeight: FontWeight.w400),
            )),
        Container(
            margin: EdgeInsets.only(top: isDesktop ? 30 : 10, bottom: 20),
            padding: EdgeInsets.only(
                left: Responsive.isDesktop() ? 170 : 15,
                right: Responsive.isDesktop() ? 170 : 15),
            width: double.infinity,
            child: AutoSizeText(
              projeto.descricao,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: isDesktop ? 23 : 14, fontWeight: FontWeight.w400),
            )),
        projeto.imagens.isEmpty
            ? Container()
            : Container(
                alignment: Alignment.center,
                height: isMobile ? 350 : 500,
                child: /* isMobile
                    ? CarouselSlider(
                        options: CarouselOptions(height: 400.0),
                        items: controller.projeto.imagens
                            .map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: 300,
                                  margin: const EdgeInsets.only(
                                      left: 5, right: 5),
                                  child: Image.network(i));
                            },
                          );
                        }).toList(),
                      )
                    : */
                    ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: projeto.imagens
                      .map((i) => Container(
                          //width: 350,
                          height: isMobile ? 350 : 500,
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          child: ExtendedImage.network(i)))
                      .toList(),
                ),
              ),
        Container(
          padding: const EdgeInsets.only(bottom: 10, top: 20),
          alignment: Alignment.bottomCenter,
          child: OutlinedButton(
            child: const Text('VOLTAR AO TOPO',
                style: TextStyle(color: Colors.white)),
            onPressed: () {
              controller.voltarAoTopo();
            },
          ),
        )
      ],
    );
  }
}
