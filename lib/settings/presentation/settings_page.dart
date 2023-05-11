import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../design_system/box_spacing/box_spacer.dart';
import '../../global/aplication/bloc_controller/events.dart';
import '../../global/aplication/bloc_controller/settings_bloc.dart';
import '../../global/aplication/getx_controller/view_controller.dart';
import 'widgets/custom_app_settings_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool? switchValue;
  bool? gridValue;
  bool isLoading = true;

  ViewController viewController = Get.find();

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      switchValue = _prefs.getBool('switchValue') ?? false;
      gridValue = _prefs.getBool('gridValue') ?? false;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Configurações'),
            ),
            body: Column(
              children: [
                const DSBoxSpacing.xLarge(),
                CustomAppSettingsPreferenceWidget(
                  title: 'Modo Noturno',
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                    _prefs.setBool('switchValue', value);
                    BlocProvider.of<SettingsBloc>(context).add(SwitchEvent());
                  },
                  switchValue: switchValue,
                ),
                CustomAppSettingsPreferenceWidget(
                  title: 'Visualização em Grade',
                  onChanged: (value) {
                    setState(() {
                      gridValue = value;
                    });
                    //TODO Salva o valor no SharedPreferences
                    _prefs.setBool(
                      'gridValue',
                      value,
                    );
                    viewController.changeViewMode(value: value);
                  },
                  switchValue: gridValue,
                )
              ],
            ),
          );
  }
}
