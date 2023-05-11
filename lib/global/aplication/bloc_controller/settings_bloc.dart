// ignore_for_file: unnecessary_lambdas, discarded_futures
// ignore_for_file:invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../design_system/constants/constants_strings.dart';
import 'events.dart';
import 'states.dart';

///bloc usado para gerencia o modo (escuro ou claro) escolhido pelo usuário.
class SettingsBloc extends Bloc<SwitchEvent, BlocState> {
  SettingsBloc() : super(InitialState(themeMode: false)) {
    getInitialState().then((state) {
      emit(state);
    });

    ///definição da stream do SwitchEvent.
    on<SwitchEvent>((event, emit) {
      final currentState = state;
      final switchValue = !currentState.themeMode;
      emit(SucessState(themeMode: switchValue));
    });
  }

  /// Método getIntitialState para recuperar da memória do dispostivo a
  /// Preferencia do usuário referente ao modo noturno.
  Future<BlocState> getInitialState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool themeMode =
        prefs.getBool(ConstantsStrings.switchPreferencesPath) ?? false;
    return InitialState(themeMode: themeMode);
  }
}
