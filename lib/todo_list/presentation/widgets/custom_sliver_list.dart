import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../global/aplication/mobx_controller.dart/todo_controller.dart';

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({
    required this.controller,
    super.key,
  });

  final TodoController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                title: Text(controller.allTasks[index].title),
                subtitle: Text(controller.allTasks[index].description),
                trailing: IconButton(
                  onPressed: () {
                    controller.removeTask(index);
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
            childCount: controller.allTasks.length,
          ),
        );
      },
    );
  }
}
