// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../global/aplication/getx_controller/view_controller.dart';
import '../../../global/aplication/mobx_controller.dart/todo_controller.dart';
import 'custom_sliver_grid.dart';
import 'custom_sliver_list.dart';

class CustomSliverItems extends StatefulWidget {
  const CustomSliverItems({
    super.key,
  });

  @override
  State<CustomSliverItems> createState() => _CustomSliverItemsState();
}

class _CustomSliverItemsState extends State<CustomSliverItems> {
  ///recuperação da instância do ViewController (feita no get.put()) por meio
  ///de Get.find().
  ViewController viewController = Get.find();

  ///uso do método initState() para recuperar da memória do disposivo qual modo
  ///o usuário escolheu por último antes de fechar o app por meio do método
  /// loadGridMode do viewController.
  @override
  void initState() {
    super.initState();
    viewController.loadGridMode();
  }

  @override
  Widget build(BuildContext context) {
    ///Recuperação do TodoController via provider.
    final dataController = Provider.of<TodoController>(context);

    ///Uso do Obx do package 'GetX' para gerar a reatividade  quando as
    ///variáveis obseváveis forem modificas.
    return Obx(
      ///verificação da variáel gridMode, recuperada do viewController para
      /// decidir qual modo de exibição dos cards irá aparecer para o usário.
      () => viewController.gridMode.value
          ? CustomSliverGrid(controller: dataController)
          : CustomSliverList(controller: dataController),
    );
  }
}
