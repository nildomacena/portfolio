import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:portfolio/home/widgets/contato/contato_controller.dart';
import 'package:portfolio/responsive.dart';

class ContainerContato extends StatelessWidget {
  final ContatoController controller = Get.put(ContatoController());
  ContainerContato({Key? key}) : super(key: key);

  Widget formularioMobile() {
    return Container(
      alignment: Alignment.topCenter,
      child: Form(
        key: controller.formKey,
        child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                margin: const EdgeInsets.only(
                    bottom: 10, top: 50, left: 30, right: 30),
                child: const Text(
                  'Quer fazer uma proposta ou orçamento? Tá querendo tirar alguma dúvida ou pedir ajuda em algum projeto? Quer um ombro amigo pra desabafar? Ajuda pra fazer uma mudança de apartamento? Fica com vergonha não, envia uma mensagem!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  controller: controller.nomeController,
                  validator: controller.validatorNome,
                  decoration: const InputDecoration(
                      hintText: 'Seu nome',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  controller: controller.emailController,
                  validator: controller.validatorEmail,
                  decoration: const InputDecoration(
                      hintText: 'Contato',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  controller: controller.mensagemController,
                  validator: controller.validatorMensagem,
                  minLines: 3,
                  maxLines: 5,
                  decoration: const InputDecoration(
                      hintText: 'Mensagem',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)))),
                ),
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
                  ))
            ]),
      ),
    );
  }

  Widget formularioDesktop() {
    return Container(
      alignment: Alignment.topCenter,
      width: Get.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Form(
                key: controller.formKey,
                child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Container(
                        width: Get.width / 4,
                        margin: const EdgeInsets.only(
                            bottom: 20, top: 50, left: 30, right: 30),
                        child: const Text(
                          'Quer fazer uma proposta ou orçamento? Tá querendo tirar alguma dúvida ou pedir ajuda em algum projeto? Quer um ombro amigo pra desabafar? Ajuda pra fazer uma mudança de apartamento? Fica com vergonha não, envia uma mensagem!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        ),
                      ),
                      Container(
                        width: Get.width / 4,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 5, bottom: 5, right: 10),
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
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 5, bottom: 5),
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
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        child: TextFormField(
                          controller: controller.mensagemController,
                          validator: controller.validatorMensagem,
                          minLines: 3,
                          maxLines: 5,
                          decoration: const InputDecoration(
                              hintText: 'Mensagem',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)))),
                        ),
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
                          ))
                    ]),
              ),
            ),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(left: 130),
            height: 400,
            width: Get.width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      'Ainda tá com vergonha de mandar mensagem por aqui? Entra em contato através das minhas redes então! Prometo que te respondo rápido 😉',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: Get.width / 2,
                      child: Row(children: [
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: CircleAvatar(
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.network(
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Telegram_logo.svg/512px-Telegram_logo.svg.png'),
                              ),
                              maxRadius: 25,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: CircleAvatar(
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/iacs-c71ce.appspot.com/o/LinkedIn_icon_circle.svg.png?alt=media&token=33d367dc-caf4-4a08-9418-aba06fd50eb8'),
                              ),
                              maxRadius: 25,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: CircleAvatar(
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/iacs-c71ce.appspot.com/o/whatsapp.png?alt=media&token=ec598a84-3788-4da3-9bab-6e3268e62eb4'),
                              ),
                              maxRadius: 25,
                            ),
                          ),
                        ),
                      ]),
                    ))
              ],
            ),
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 30, bottom: 30),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const Divider(
            thickness: 1,
          ),
          GetBuilder<ContatoController>(builder: (_) {
            return Container(
                width: Responsive.isMobile() ? Get.width : 1000,
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Responsive.isMobile()
                    ? formularioMobile()
                    : formularioDesktop());
          }),
        ],
      ),
    );
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
        ],
      ),
    );
  }
}
