import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  Debouncer({this.delay = 500});

  final int delay;
  Timer? _timer;

  void runDebouncedFunction(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: delay), callback);
  }
}
