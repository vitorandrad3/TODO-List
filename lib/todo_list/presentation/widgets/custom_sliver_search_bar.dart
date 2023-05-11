import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../design_system/constants/spacing.dart';
import '../../../global/aplication/mobx_controller.dart/todo_controller.dart';

class CustomSliverSearchBar extends StatelessWidget {
  const CustomSliverSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dataController = Provider.of<TodoController>(context);

    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.all(DSSpacing.medium),
          child: TextFormField(
            onChanged: dataController.filterSearch,
            decoration: const InputDecoration(
              labelText: 'Buscar tarefas...',
            ),
          ),
        ),
      ]),
    );
  }
}
