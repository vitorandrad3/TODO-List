import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'global/aplication/getx_controller/view_controller.dart';
import 'global/aplication/mobx_controller.dart/todo_controller.dart';
import 'global/domain/todo_repository.dart';
import 'global/infrastructure/todo_repository_impl.dart';
import 'services/auth_service.dart';
import 'todo_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ///incialização do repositório no início da aplicação a fim de fornece-la ao
  ///controller que gerencia a lista de tarefas.
  final TodoRepository repository = TodoRepositoryImpl();

  ///incialização do controller de visualização dos items com GetX usando o
  ///Get.put() para posterior recuperação da instância em diferentes partes do
  ///aplicativo.
  //dispensa o uso do contexto para recuperção da instância.
  Get.put(ViewController());

  runApp(
    ///uso do Provider para prover uma instância única do TodoController,aaaaaaa
    ///possibilitando a recuperação do mesmo a partir do contexto dos widgets
    ///filhos
    //TODO PROVIDER
    MultiProvider(
      providers: [
        Provider<TodoController>(
          create: (_) => TodoController(repository),
        ),
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: const TodoList(),
    ),
  );
}
