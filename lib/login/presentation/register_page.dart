import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../design_system/box_spacing/box_spacer.dart';
import '../../design_system/constants/constants_strings.dart';
import '../../global/presentation/widgets/custom_text_form_field.dart';
import '../../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of<AuthService>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const DSBoxSpacing.xxLarge(),
          Text(
            'Registro',
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
                const DSBoxSpacing(),
                CustomTextFormField(
                  onSaved: (value) {
                    confirmPassword = value!;
                  },
                  validator: (value) {
                    return confirmPassword != password
                        ? 'as senhas não correspondem'
                        : null;
                  },
                  label: 'confirme a senha',
                ),
              ],
            ),
          ),
          const DSBoxSpacing.xxLarge(),
          ElevatedButton(
            onPressed: () {
              _formKey.currentState!.save();
              final bool isValid = _formKey.currentState!.validate();
              if (isValid) {
                auth.register(email, password, context);
                _formKey.currentState!.reset();
              }
            },
            child: const Text('Registrar-se'),
          ),
        ],
      ),
    );
  }
}
