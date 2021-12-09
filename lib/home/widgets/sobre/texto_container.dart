import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/responsive.dart';

class TextoContainer extends StatelessWidget {
  const TextoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double tamanhoFonte = Responsive.isDesktop() ? 30 : 18;
    TextStyle style =
        GoogleFonts.lato(textStyle: TextStyle(fontSize: tamanhoFonte));
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: Get.width,
            child: Text(
              'Olá!',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                  textStyle: TextStyle(
                      fontSize: Responsive.isDesktop() ? 50 : 25,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
              width: Get.width,
              margin: EdgeInsets.only(
                  top: 5,
                  left: Responsive.isMobile() ? 20 : 130,
                  right: Responsive.isMobile() ? 20 : 130),
              child: Text(
                'Meu nome é Ednildo Macena. Sou desenvolvedor há 10 anos. Buscar resolver problemas é aquilo que me move!',
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
        ],
      ),
    );
  }
}
