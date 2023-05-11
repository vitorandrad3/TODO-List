import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../design_system/box_spacing/box_spacer.dart';
import '../../../global/aplication/mobx_controller.dart/todo_controller.dart';
import 'custom_text_form_field.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({
    super.key,
  });

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  String taskTitle = '';
  String taskDescription = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TodoController>(context);
    return Column(
      children: [
        const DSBoxSpacing.xLarge(),
        Text(
          'Adicione uma nova tarefa',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const DSBoxSpacing.xLarge(),
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                validatorMessage: 'informe o título da tarefa',
                onSaved: (title) {
                  taskTitle = title!;
                },
                label: 'título',
              ),
              const DSBoxSpacing(),
              CustomTextFormField(
                validatorMessage: 'informe a descrição da tarefa',
                onSaved: (description) {
                  taskDescription = description!;
                },
                label: 'Descrição',
              )
            ],
          ),
        ),
        const DSBoxSpacing.xLarge(),
        ElevatedButton(
          onPressed: () {
            final bool isValid = _formKey.currentState!.validate();
            if (isValid) {
              _formKey.currentState!.save();
              controller.addNewTask(
                title: taskTitle,
                description: taskDescription,
              );
              _formKey.currentState!.reset();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Tarefa adicionada com sucesso!'),
                ),
              );
            }
          },
          child: const Text('adicionar'),
        )
      ],
    );
  }
}
