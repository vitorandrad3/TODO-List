
import 'package:flutter/material.dart';

import '../../../design_system/constants/spacing.dart';

class CustomAppSettingsPreferenceWidget extends StatefulWidget {
  const CustomAppSettingsPreferenceWidget({
    required this.title,
    required this.onChanged,
    required this.switchValue,
    super.key,
  });

  final bool? switchValue;
  final String title;

  ///TODO void callback usada (filho para o pai)
  final void Function(bool)? onChanged;

  @override
  State<CustomAppSettingsPreferenceWidget> createState() =>
      _CustomAppSettingsPreferenceWidgetState();
}

class _CustomAppSettingsPreferenceWidgetState
    extends State<CustomAppSettingsPreferenceWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DSSpacing.medium,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Switch(
            value: widget.switchValue ?? false,
            onChanged: widget.onChanged,
          )
        ],
      ),
    );
  }
}
