import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/model/projeto.model.dart';

class FirestoreProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Projeto>> getProjetos() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('portfolio/portfolio/projetos').get();
    return querySnapshot.docs.map((s) => Projeto.fromFirestore(s)).toList();
  }
}
