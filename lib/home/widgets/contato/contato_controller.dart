import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/data/firestore_provider.dart';

class ContatoController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirestoreProvider firestoreProvider = Get.find();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mensagemController = TextEditingController();

  bool houveErro = false;
  bool enviando = false;

  String? validatorNome(String? nome) {
    if (nome == null || nome.isEmpty) {
      return 'Digite seu nome';
    }
  }

  String? validatorEmail(String? nome) {
    if (nome == null || nome.isEmpty) {
      return 'Digite seu contato';
    }
  }

  String? validatorMensagem(String? nome) {
    if (nome == null || nome.isEmpty) {
      return 'Digite sua mensagem';
    }
  }

  enviarMensagem() async {
    if (!formKey.currentState!.validate()) {
      houveErro = true;
      Get.snackbar('Erro!',
          'Preencha o formulário completo ou entra em contato via Telegram',
          margin: const EdgeInsets.only(top: 50),
          duration: const Duration(seconds: 4),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          maxWidth: 400,
          mainButton: TextButton(
              onPressed: () {
                window.open('https://t.me/NildoMacena', 'Telegram');
              },
              child: const Text(
                'TELEGRAM',
                style: TextStyle(color: Colors.white),
              )));
      update();
      return;
    }
    houveErro = false;
    update();
    try {
      enviando = true;
      update();
      await firestoreProvider.enviarMensagem(
          nomeController.text, emailController.text, mensagemController.text);
      Get.snackbar(
        'Sucesso!',
        'Prontinho! Sua mensagem foi enviada. Agora é só aguardar que eu te retorno.',
        margin: const EdgeInsets.only(top: 50),
        maxWidth: 400,
      );
    } catch (e) {
      print('Erro: $e');
      Get.snackbar('Erro!',
          'Ocorreu um erro durante o envio da mensagem. Tente novamente mais tarde ou entra em contato via Telegram',
          margin: const EdgeInsets.only(top: 50),
          maxWidth: 400,
          duration: const Duration(seconds: 4),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          mainButton: TextButton(
              onPressed: () {
                window.open('https://t.me/NildoMacena', 'Telegram');
              },
              child: const Text(
                'TELEGRAM',
                style: TextStyle(color: Colors.white),
              )));
    }
    enviando = false;
    update();
  }
}
