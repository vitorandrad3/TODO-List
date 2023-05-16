// ignore_for_file: cascade_invocations

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../design_system/constants/constants_strings.dart';
import '../domain/todo_repository.dart';

///implementação do repositório da aplicação.
class TodoRepositoryImpl implements TodoRepository {
  @override

  ///utilização da classe Either do package dartz para o tratamento de
  ///possiveis erros das requições ao banco de dados.

  ///método getAllTasks para a incialização do banco de dados.
  ///TODO dartz
  Future<Either<String, List<Map<String, dynamic>>>> getAllTasks() async {
    try {
      ///TODO requisição http/conexão com API
      final response = await http.get(
        Uri.parse('${ConstantsStrings.baseDBURL}/tasks.json'),
      );

      ///verificação se a conexão com o banco de dados  foi bem sucedida
      if (response.statusCode == 200) {
        final List listData = [];

        ///TODO json
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        jsonResponse.forEach((id, data) {
          data['id'] = id;
          listData.add(data);
        });

        ///à direita, a reposta é a lista com os dados para a utilização no app
        return right(
          listData
              .map<Map<String, dynamic>>(
                (tasks) => tasks as Map<String, dynamic>,
              )
              .toList(),
        );
      } else {
        ///à esquerda é uma mensagem de erro para exibir no log.
        return left('falha ao tentar recuperar os dados');
      }
    } catch (error) {
      ///caso a conexão com a API falhe, enviará a mensagem de erro ao lado
      ///esquerdo
      return left(error.toString());
    }
  }
}
