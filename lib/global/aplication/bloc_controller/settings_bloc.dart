// ignore_for_file: unnecessary_lambdas, discarded_futures
// ignore_for_file:invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'events.dart';
import 'states.dart';

class SettingsBloc extends Bloc<SwitchEvent, BlocState> {
  SettingsBloc() : super(InitialState(themeMode: false)) {
    getInitialState().then((state) {
      emit(state);
    });

    on<SwitchEvent>((event, emit) {
      final currentState = state;

      final switchValue = !currentState.themeMode;
      emit(SucessState(themeMode: switchValue));
    });
  }

  Future<BlocState> getInitialState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool themeMode = prefs.getBool('switchValue') ?? true;
    return InitialState(themeMode: themeMode);
  }
}
