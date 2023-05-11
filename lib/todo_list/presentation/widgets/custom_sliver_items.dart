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
  ViewController viewController = Get.find();

  @override
  void initState() {
    super.initState();
    viewController.loadGridMode();
  }

  @override
  Widget build(BuildContext context) {
    final dataController = Provider.of<TodoController>(context);
    return Obx(
      () => viewController.gridMode.value
          ? CustomSliverGrid(controller: dataController)
          : CustomSliverList(controller: dataController),
    );
  }
}
