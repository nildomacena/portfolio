import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:portfolio/data/firestore_provider.dart';
import 'package:portfolio/model/projeto.model.dart';

class HomeController extends GetxController {
  List<Projeto> projetos = [];
  final FirestoreProvider provider =
      Get.put(FirestoreProvider(), permanent: true);
  final Query query =
      FirebaseFirestore.instance.collection('portfolio/portfolio/projetos');
  @override
  void onInit() {
    initProjetos();
    super.onInit();
  }

  initProjetos() {
    print('init projetos');
    provider.getProjetos().then((value) {
      projetos = value;
      print(projetos);
      update();
    });
  }
}
