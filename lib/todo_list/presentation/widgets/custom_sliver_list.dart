import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../global/aplication/mobx_controller.dart/todo_controller.dart';

///widget para exibir as tarefas no modo "lista", usando o
///SliverChildBuilderDelegate, recebendo as informações do TodoController.
class CustomSliverList extends StatelessWidget {
  const CustomSliverList({
    required this.controller,
    super.key,
  });

  ///recepção do controller via parâmetro para a utilização do widget modularizado
  final TodoController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(controller.allTasks[index].title),
                    subtitle: Text(controller.allTasks[index].description),
                    trailing: IconButton(
                      onPressed: () {
                        controller.removeTask(index);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              );
            },
            childCount: controller.allTasks.length,
          ),
        );
      },
    );
  }
}
