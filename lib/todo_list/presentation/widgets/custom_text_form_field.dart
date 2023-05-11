import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.validatorMessage,
    required this.onSaved,
    required this.label,
    super.key,
  });

  final String label;
  final void Function(String? value) onSaved;
  final String validatorMessage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: TextFormField(
        onSaved: onSaved,
        validator: (value) {
          return value!.isEmpty ? validatorMessage : null;
        },
        decoration: InputDecoration(
          label: Text(label),
        ),
      ),
    );
  }
}
