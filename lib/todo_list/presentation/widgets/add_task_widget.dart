import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../design_system/box_spacing/box_spacer.dart';
import '../../../design_system/constants/constants_strings.dart';
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
  ///variáveis de controle  que receberão o valor dos textfields e enviar ao
  ///banco de dados
  String taskTitle = '';
  String taskDescription = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ///recuperação da instância do TodoController por meio do provider.
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
                validatorMessage: ConstantsStrings.titleValidatorMessage,
                onSaved: (title) {
                  taskTitle = title!;
                },
                label: ConstantsStrings.title,
              ),
              const DSBoxSpacing(),
              CustomTextFormField(
                validatorMessage: ConstantsStrings.descriptionValidatorMessage,
                onSaved: (description) {
                  taskDescription = description!;
                },
                label: ConstantsStrings.description,
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
                  content: Text(ConstantsStrings.sucessAddTaskMessage),
                ),
              );
            }
          },
          child: const Text(ConstantsStrings.buttonAddTitle),
        )
      ],
    );
  }
}
