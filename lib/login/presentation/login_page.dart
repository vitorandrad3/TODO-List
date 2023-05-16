import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../design_system/box_spacing/box_spacer.dart';
import '../../design_system/constants/constants_strings.dart';
import '../../global/presentation/widgets/custom_text_form_field.dart';
import '../../services/auth_service.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of<AuthService>(context);
    String email = '';
    String password = '';
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const DSBoxSpacing.xxLarge(),
          Text(
            'Login',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const DSBoxSpacing.xxLarge(),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  validatorMessage: 'informe o email',
                  onSaved: (value) {
                    email = value!;
                  },
                  label: 'Email',
                ),
                const DSBoxSpacing(),
                CustomTextFormField(
                  validatorMessage: 'informe a senha',
                  onSaved: (value) {
                    password = value!;
                  },
                  label: 'Senha',
                ),
              ],
            ),
          ),
          const DSBoxSpacing.xxLarge(),
          ElevatedButton(
            onPressed: () {
              final bool isValid = _formKey.currentState!.validate();
              if (isValid) {
                _formKey.currentState!.save();
                auth.login(email, password, context);
                _formKey.currentState!.reset();
              }
            },
            child: const Text('Entrar'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Não tem uma conta ainda ?'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RegisterPage(),
                    ),
                  );
                },
                child: const Text('Cadastre-se'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
