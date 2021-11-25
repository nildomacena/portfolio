import 'package:cloud_firestore/cloud_firestore.dart';

class Projeto {
  final String id;
  final String descricao;
  final String nome;

  Projeto({required this.id, required this.descricao, required this.nome});

  factory Projeto.fromFirestore(QueryDocumentSnapshot<Object?> snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return Projeto(
        id: snapshot.id, descricao: data['descricao'], nome: data['nome']);
  }
}
