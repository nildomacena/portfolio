import 'package:cloud_firestore/cloud_firestore.dart';

class Projeto {
  final String id;
  final String descricao;
  final String nome;
  final String subtitulo;
  final String imagem;
  final String icone;
  final List<String> imagens;
  String? link;

  Projeto(
      {required this.id,
      required this.descricao,
      required this.nome,
      required this.imagem,
      required this.subtitulo,
      required this.icone,
      required this.imagens,
      required this.link});

  factory Projeto.fromFirestore(QueryDocumentSnapshot<Object?> snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    List<String> imagens = [];
    if (data['imagens'] != null && data['imagens'].length > 0) {
      for (String i in data['imagens']) {
        imagens.add(i);
      }
    }
    return Projeto(
        id: snapshot.id,
        descricao: data['descricao'],
        nome: data['nome'],
        subtitulo: data['subtitulo'] ?? '',
        icone: data['icone'] ?? '',
        imagens: imagens,
        imagem: data['imagem'] ?? '',
        link: data['link']);
  }
}
