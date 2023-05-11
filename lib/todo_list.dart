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
  @override
  void initState() {
    super.initState();
    bloc = SettingsBloc();
    bloc.add(SwitchEvent());
  }

  ///TODO ver porque o didChangeDependencies funciona nesse caso para
  ///inicializar o banco de dados.
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
