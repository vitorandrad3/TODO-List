import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../design_system/box_spacing/box_spacer.dart';
import '../../../global/aplication/mobx_controller.dart/todo_controller.dart';

///widget para exibir as tarefas no modo "grade", usando o
///SliverChildBuilderDelegate, recebendo as informações do TodoController.
class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({required this.controller, super.key});

  ///recepção do controller via parâmetro a a fim de modularizar o código.
  final TodoController controller;

  @override
  Widget build(BuildContext context) {
    ///uso o Obeserver do package 'MobX' para gerar a reatividade quando as
    ///variáveis observáveis forem modificadas.
    return Observer(
      builder: (_) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                children: [
                  const DSBoxSpacing(),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      width: double.infinity,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            const DSBoxSpacing(),
                            Text(
                              controller.allTasks[index].title,
                            ),
                            const DSBoxSpacing.xLarge(),
                            Text(
                              controller.allTasks[index].description,
                              style: Theme.of(context).textTheme.caption,
                            ),
                            const DSBoxSpacing.xLarge(),
                            Row(
                              children: [
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    controller.removeTask(index);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            childCount: controller.allTasks.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
          ),
        );
      },
    );
  }
}
