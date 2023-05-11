import 'package:dartz/dartz.dart';

abstract class TodoRepository {
  Future<Either<String, List<Map<String, dynamic>>>> getAllTasks();
}
