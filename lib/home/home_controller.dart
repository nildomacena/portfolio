import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/data/firestore_provider.dart';
import 'package:portfolio/model/projeto.model.dart';
import 'package:portfolio/responsive.dart';

class HomeController extends GetxController {
  List<Projeto> projetos = [];
  List<Projeto> projetosAux = [];
  final FirestoreProvider provider =
      Get.put(FirestoreProvider(), permanent: true);
  final Query query =
      FirebaseFirestore.instance.collection('portfolio/portfolio/projetos');
  Projeto? projetoSelecionado;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    initProjetos();
    super.onInit();
  }

  //double get widthCards => Responsive().is
  initProjetos() async {
    await provider.getProjetos().then((value) {
      projetosAux = projetos = value;
      update();
    });
  }

  promisePreCache(BuildContext context) async {
    List<Future> futures = [];
    for (var p in projetos) {
      futures.add(precacheImage(NetworkImage(p.imagem), context));
      futures.add(precacheImage(NetworkImage(p.icone), context));
    }
    return Future.wait(futures);
  }

  voltarAoTopo() async {
    const Duration duration = Duration(milliseconds: 500);
    scrollController.animateTo(0, duration: duration, curve: Curves.easeIn);
    await Future.delayed(duration);
    projetoSelecionado = null;
    projetos = projetosAux;
    update();
  }

  onSelectProjeto(Projeto projeto) {
    if (projetoSelecionado != null &&
        projetoSelecionado!.id.contains(projeto.id)) {
      projetoSelecionado = null;
      scrollController.animateTo(0,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      projetos = projetosAux;
      update();
    } else {
      projetoSelecionado = projeto;
      projetos = projetosAux
          .where((p) => !p.id.contains(projetoSelecionado!.id))
          .toList();
      update();
      scrollController.animateTo(
          Get.height + (Responsive.isMobile() ? 400 : 450),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn);
    }
  }
}
