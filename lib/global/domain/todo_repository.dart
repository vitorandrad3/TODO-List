import 'package:dartz/dartz.dart';

///interface do repositório
abstract class TodoRepository {
  Future<Either<String, List<Map<String, dynamic>>>> getAllTasks();
}
