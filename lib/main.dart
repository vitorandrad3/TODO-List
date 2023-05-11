import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'global/aplication/getx_controller/view_controller.dart';
import 'global/aplication/mobx_controller.dart/todo_controller.dart';
import 'global/domain/todo_repository.dart';
import 'global/infrastructure/todo_repository_impl.dart';
import 'todo_list.dart';

void main() {
  ///incialização do repositório no início da aplicação a fim de fornece-la ao
  ///controller que gerencia a lista de tarefas.
  final TodoRepository repository = TodoRepositoryImpl();

  ///incialização do controller de visualização dos items com GetX usando o
  ///Get.put() para posterior recuperação da instância em diferentes partes do
  ///aplicativo, não pode ser provido no campo "MultiProviders" do Provider
  ///devido a conflitos dos packages.
  //dispensa o uso do contexto para recuperção da instância.
  Get.put(ViewController());

  runApp(
    ///uso do Provider para prover uma instância única do TodoController,
    ///possibilitando a recuperação do mesmo a partir do contexto dos widgets
    ///filhos
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
