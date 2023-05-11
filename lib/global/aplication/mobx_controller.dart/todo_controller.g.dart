// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoController on _TodoControllerBase, Store {
  late final _$allTasksAtom =
      Atom(name: '_TodoControllerBase.allTasks', context: context);

  @override
  ObservableList<dynamic> get allTasks {
    _$allTasksAtom.reportRead();
    return super.allTasks;
  }

  @override
  set allTasks(ObservableList<dynamic> value) {
    _$allTasksAtom.reportWrite(value, super.allTasks, () {
      super.allTasks = value;
    });
  }

  late final _$initDBAsyncAction =
      AsyncAction('_TodoControllerBase.initDB', context: context);

  @override
  Future<void> initDB() {
    return _$initDBAsyncAction.run(() => super.initDB());
  }

  late final _$removeTaskAsyncAction =
      AsyncAction('_TodoControllerBase.removeTask', context: context);

  @override
  Future<void> removeTask(int index) {
    return _$removeTaskAsyncAction.run(() => super.removeTask(index));
  }

  late final _$_TodoControllerBaseActionController =
      ActionController(name: '_TodoControllerBase', context: context);

  @override
  void addNewTask({required String title, required String description}) {
    final _$actionInfo = _$_TodoControllerBaseActionController.startAction(
        name: '_TodoControllerBase.addNewTask');
    try {
      return super.addNewTask(title: title, description: description);
    } finally {
      _$_TodoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allTasks: ${allTasks}
    ''';
  }
}
