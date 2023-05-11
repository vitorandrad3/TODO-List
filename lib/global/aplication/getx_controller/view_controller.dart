// ignore_for_file: use_setters_to_change_properties

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../design_system/constants/constants_strings.dart';

class ViewController extends GetxController {
  RxBool gridMode = false.obs;

  Future<void> loadGridMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool savedGridMode =
        prefs.getBool(ConstantsStrings.gridPreferencesPath) ?? false;
    gridMode.value = savedGridMode;
  }

  void changeViewMode({required bool value}) {
    gridMode.value = value;
  }
}
