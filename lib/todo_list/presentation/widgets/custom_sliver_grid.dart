import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../design_system/box_spacing/box_spacer.dart';
import '../../../global/aplication/mobx_controller.dart/todo_controller.dart';

class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({required this.controller, super.key});

  final TodoController controller;

  @override
  Widget build(BuildContext context) {
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
                                  icon: const Icon(Icons.delete),
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
