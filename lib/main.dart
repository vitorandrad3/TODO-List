import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'global/aplication/getx_controller/view_controller.dart';
import 'global/aplication/mobx_controller.dart/todo_controller.dart';
import 'global/domain/todo_repository.dart';
import 'global/infrastructure/todo_repository_impl.dart';
import 'todo_list.dart';

void main() {
  final TodoRepository repository = TodoRepositoryImpl();
  Get.put(ViewController());
  runApp(
    MultiProvider(
      providers: [
        Provider<TodoController>(
          create: (_) => TodoController(repository),
        ),
      ],
      child: const TodoList(),
    ),
  );
}
