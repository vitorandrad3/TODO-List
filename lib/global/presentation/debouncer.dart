import 'dart:async';

import 'package:flutter/material.dart';

///classe Debouncer com a finalidade de otimizar as possíveis requições
///desnessárias à alguma API, usado na SearchBar para atrasar por alguns
///segundos as requisões de filtro na lista de tarefas.
class Debouncer {
  Debouncer({this.delay = 500});

  final int delay;
  Timer? _timer;

  void runDebouncedFunction(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: delay), callback);
  }
}
