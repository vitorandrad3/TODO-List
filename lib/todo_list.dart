import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'design_system/themeData/theme_mode.dart';
import 'global/aplication/bloc_controller/events.dart';
import 'global/aplication/bloc_controller/settings_bloc.dart';
import 'global/aplication/bloc_controller/states.dart';
import 'global/aplication/mobx_controller.dart/todo_controller.dart';
import 'todo_list/presentation/home_page.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

late final SettingsBloc bloc;

class _TodoListState extends State<TodoList> {
  /// uso do método initState() para inicialização do SettingsBloc
  @override
  void initState() {
    super.initState();
    bloc = SettingsBloc();

    ///adição dos evento no bloc
    bloc.add(SwitchEvent());
  }

  ///método didChangeDependencies() utilizado para recuperar a instância do
  ///TodoController e inicializar o banco de dados com o método initDB() quando
  /// o app é iniciado.
  @override
  void didChangeDependencies() {
    Provider.of<TodoController>(context).initDB();

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();

    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    ///inserção do BlocProvider para que seja possivel a recuperação da
    ///instância do Bloc nas difetentes partes do aplicativo.
    return BlocProvider(
      create: (context) => SettingsBloc(),
      child: BlocBuilder<SettingsBloc, BlocState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.themeMode
                ? CustomThemeMode.darkTheme
                : CustomThemeMode.lightTheme,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
