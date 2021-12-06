import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/home/widgets/sobre/background.dart';
import 'package:portfolio/home/widgets/sobre/lista_projetos.dart';
import 'package:portfolio/home/widgets/sobre/texto_container.dart';
import 'package:portfolio/responsive.dart';

class SobreContainer extends StatelessWidget {
  const SobreContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double tamanhoFonte = Responsive.isDesktop() ? 30 : 18;
    TextStyle style =
        GoogleFonts.lato(textStyle: TextStyle(fontSize: tamanhoFonte));

    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Stack(
        children: [
          //const Background(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: Get.width,
                margin: const EdgeInsets.only(bottom: 30),
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  margin: EdgeInsets.only(top: Responsive.isMobile() ? 10 : 50),
                  height: Responsive.isDesktop() || Responsive.isTablet()
                      ? 200
                      : 100,
                  width: Responsive.isDesktop() || Responsive.isTablet()
                      ? 200
                      : 100,
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/iacs-c71ce.appspot.com/o/eu.jpeg?alt=media&token=e6ea57d9-f643-47fd-84b0-fd27e49c21f1',
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: const TextoContainer(),
              ),

              /*  SizedBox(
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
              ), */
              /* Expanded(child: Container()), */
              Expanded(
                  child: Container(
                      //padding: const EdgeInsets.only(bottom: 20),
                      child: ListaProjetos()))
            ],
          ),
        ],
      ),
    );
  }
}
