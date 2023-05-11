abstract class BlocState {
  BlocState({required this.themeMode});

  bool themeMode;
}

class InitialState extends BlocState {
  InitialState({required super.themeMode});
}

class SucessState extends BlocState {
  SucessState({required super.themeMode});
}
