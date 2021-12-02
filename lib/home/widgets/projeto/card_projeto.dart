import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:portfolio/model/projeto.model.dart';
import 'package:portfolio/responsive.dart';

class CardProjeto extends StatelessWidget {
  final double height;
  final double width;
  final Projeto projeto;

  const CardProjeto(
      {required this.projeto,
      required this.height,
      required this.width,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 15, right: 15),
        /*  width: 300,
        height: 300, */
        child: ClipOval(
          child: Image.network(
            projeto.icone,
            width: Responsive.isDesktop() ? 200 : 100,
            height: Responsive.isDesktop() ? 200 : 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
      hoverChild: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            height: 100,
            width: 200,
            decoration: BoxDecoration(
                //color: Colors.grey[500],
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: AutoSizeText(
              projeto.nome,
              maxLines: 2,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 15, right: 15),
            /*  width: 300,
        height: 300, */
            child: ClipOval(
              child: Image.network(
                projeto.icone,
                opacity: AlwaysStoppedAnimation<double>(.2),
                width: Responsive.isDesktop() ? 200 : 100,
                height: Responsive.isDesktop() ? 200 : 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      onHover: (point) {
        print('onHover $point');
      },
    );
  }
}
