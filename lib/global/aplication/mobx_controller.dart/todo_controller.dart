import 'dart:convert';
import 'dart:developer' as dev;
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import '../../domain/task.dart';
import '../../domain/todo_repository.dart';
import '../../presentation/constants_strings.dart';
import '../../presentation/debouncer.dart';

part 'todo_controller.g.dart';

// ignore: library_private_types_in_public_api
class TodoController = _TodoControllerBase with _$TodoController;

abstract class _TodoControllerBase with Store {
  _TodoControllerBase(this._todoRepository);

  final TodoRepository _todoRepository;

  List<Map<String, dynamic>> allData = [];

  List controlList = [];

  @observable
  ObservableList allTasks = [].asObservable();

  @action
  void addNewTask({required String title, required String description}) {
    http
        .post(
      Uri.parse('${ConstantsStrings.baseDBURL}/tasks.json'),
      body: jsonEncode(
        {
          'title': title,
          'description': description,
          'isChecked': false,
        },
      ),
    )
        .then((result) {
      // ignore: avoid_dynamic_calls
      final String id = jsonDecode(result.body)['name'];
      allTasks.add(
        TaskModel(
          description: description,
          title: title,
          isChecked: false,
          id: id,
        ),
      );
    });
  }

  @action
  Future<void> initDB() async {
    final response = await _todoRepository.getAllTasks();

    response.fold(
      ///caso haja alguma falha na inicialização do bando de dados, irá aparecer
      ///a mensagem de erro no console, em um app real o tratamento de erro
      ///seria mais complexo.

      // ignore: unnecessary_lambdas
      (error) => dev.log(error),
      (result) {
        allData = result;
        loadTasks();
      },
    );
  }

  void loadTasks() {
    for (final data in allData) {
      allTasks.add(
        TaskModel.fromJson(data),
      );
      controlList.add(
        TaskModel.fromJson(data),
      );
    }
  }

  @action
  Future<void> removeTask(int index) async {
    // ignore: avoid_dynamic_calls
    final String id = allTasks[index].id;

    final response = await http.delete(
      Uri.parse('${ConstantsStrings.baseDBURL}/tasks/$id.json'),
    );

    if (response.statusCode == 200) {
      allTasks.removeAt(index);
    } else {
      dev.log('Failed to delete task');
    }
  }

  final debouncer = Debouncer();

  void filterSearch(String term) {
    debouncer.runDebouncedFunction(() {
      allTasks = controlList
          .where((task) {
            return task.title.toLowerCase().contains(term);
          })
          .toList()
          .asObservable();
    });
  }
}
