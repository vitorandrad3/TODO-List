import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.onSaved,
    required this.label,
    this.validatorMessage,
    this.validator,
    super.key,
  });

  final String label;
  final String? validatorMessage;
  final void Function(String? value) onSaved;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        onSaved: onSaved,
        validator: validator ??
            (value) {
              return value!.isEmpty ? validatorMessage : null;
            },
        decoration: InputDecoration(
          label: Text(label),
        ),
      ),
    );
  }
}
