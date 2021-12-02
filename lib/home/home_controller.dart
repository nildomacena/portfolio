import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/data/firestore_provider.dart';
import 'package:portfolio/model/projeto.model.dart';

class HomeController extends GetxController {
  List<Projeto> projetos = [];
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
    print('init projetos');
    await provider.getProjetos().then((value) {
      projetos = value;
      print(projetos);

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

  onSelectProjeto(Projeto projeto) {
    if (projetoSelecionado == projeto) {
      projetoSelecionado = null;
      update();
      scrollController.animateTo(0,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    } else {
      projetoSelecionado = projeto;
      update();
      scrollController.animateTo(Get.height * 2,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }
  }
}
