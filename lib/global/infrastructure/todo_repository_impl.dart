// ignore_for_file: cascade_invocations

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../domain/todo_repository.dart';
import '../presentation/constants_strings.dart';

class TodoRepositoryImpl implements TodoRepository {
  @override
  Future<Either<String, List<Map<String, dynamic>>>> getAllTasks() async {
    try {
      final response = await http.get(
        Uri.parse('${ConstantsStrings.baseDBURL}/tasks.json'),
      );
      if (response.statusCode == 200) {
        final List listData = [];
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        jsonResponse.forEach((id, data) {
          data['id'] = id;
          listData.add(data);
        });
        return right(
          listData
              .map<Map<String, dynamic>>(
                (tasks) => tasks as Map<String, dynamic>,
              )
              .toList(),
        );
      } else {
        return left('falha ao tentar recuperar os dados');
      }
    } catch (error) {
      return left(error.toString());
    }
  }
}
