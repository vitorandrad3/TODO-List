import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../login/presentation/login_page.dart';
import '../../services/auth_service.dart';
import '../../todo_list/presentation/home_page.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of<AuthService>(context);
    return Observer(
      builder: (_) {
        if (auth.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (auth.myUser == null) {
          return const LoginPage();
        } else {
          return const HomePage();
        }
      },
    );
  }
}
