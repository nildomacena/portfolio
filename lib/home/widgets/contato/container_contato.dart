import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/home/widgets/contato/contato_controller.dart';
import 'package:portfolio/responsive.dart';

class ContainerContato extends StatelessWidget {
  final ContatoController controller = Get.put(ContatoController());
  ContainerContato({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin:
                const EdgeInsets.only(bottom: 50, top: 50, left: 30, right: 30),
            child: const Text(
              'Me envie uma mensagem',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
            ),
          ),
          GetBuilder<ContatoController>(builder: (_) {
            return Container(
              width: Responsive.isMobile() ? Get.width : 1000,
              padding: const EdgeInsets.only(left: 30, right: 30),
              height: _.houveErro ? 300 : 260,
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: TextFormField(
                                controller: controller.nomeController,
                                validator: controller.validatorNome,
                                decoration: const InputDecoration(
                                    hintText: 'Seu nome',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2)))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: controller.emailController,
                              validator: controller.validatorEmail,
                              decoration: const InputDecoration(
                                  hintText: 'Contato',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2)))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: controller.mensagemController,
                      validator: controller.validatorMensagem,
                      minLines: 5,
                      maxLines: 5,
                      decoration: const InputDecoration(
                          hintText: 'Mensagem',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)))),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      width: Responsive.isMobile() ? Get.width : 1000,
                      child: SizedBox(
                        height: Responsive.isMobile() ? 45 : 55,
                        width: Responsive.isMobile() ? Get.width : 400,
                        child: GetBuilder<ContatoController>(
                          builder: (_) {
                            return ElevatedButton(
                              child: Text(_.enviando
                                  ? 'ENVIANDO MENSAGEM...'
                                  : 'ENVIAR MENSAGEM'),
                              onPressed: _.enviando
                                  ? null
                                  : () {
                                      controller.enviarMensagem();
                                    },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          Expanded(child: Container()),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text('Portfólio desenvolvido utilizando Flutter Web'),
          )
        ],
      ),
    );
    ;
  }
}
