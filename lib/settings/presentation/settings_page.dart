import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../design_system/box_spacing/box_spacer.dart';
import '../../design_system/constants/constants_strings.dart';
import '../../global/aplication/bloc_controller/events.dart';
import '../../global/aplication/bloc_controller/settings_bloc.dart';
import '../../global/aplication/getx_controller/view_controller.dart';
import 'widgets/custom_app_settings_widget.dart';

///Páginas de configurações do aplicativo
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ///variáveis de controller dos switchs que definem algumas caracterisricas do
  ///app.
  bool? switchValue;
  bool? gridValue;

  ///variável com a finalidade de só aparecer os switchs quando o app recuperar
  ///os valores do dos switchs da memória do aparelho.
  bool isLoading = true;

  ViewController viewController = Get.find();

  /// declaração da variável prefs para posterior inicialização.
  late SharedPreferences _prefs;

  /// uso do método initState() para o método initPreferences a fim de buscar
  /// na memória as preferências do usuário.
  @override
  void initState() {
    super.initState();
    _initPreferences();
  }

  ///método para buscar da memória as preferências do usuário, se o usuário
  ///nunca alterou as preferências, o valor padrão dos switch é falso.
  Future<void> _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      switchValue =
          _prefs.getBool(ConstantsStrings.switchPreferencesPath) ?? false;
      gridValue = _prefs.getBool(ConstantsStrings.gridPreferencesPath) ?? false;
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
              title: const Text(ConstantsStrings.settings),
            ),
            body: Column(
              children: [
                const DSBoxSpacing.xLarge(),
                CustomAppSettingsPreferenceWidget(
                  title: ConstantsStrings.darkMode,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });

                    ///salva no dispositivo, usando o shared_prefences, a
                    ///preferência do usuário.
                    _prefs.setBool(
                      ConstantsStrings.switchPreferencesPath,
                      value,
                    );
                    BlocProvider.of<SettingsBloc>(context).add(SwitchEvent());
                  },
                  switchValue: switchValue,
                ),
                CustomAppSettingsPreferenceWidget(
                  title: ConstantsStrings.gridView,
                  onChanged: (value) {
                    setState(() {
                      gridValue = value;
                    });
                    _prefs.setBool(
                      ConstantsStrings.gridPreferencesPath,
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
