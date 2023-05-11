import 'package:flutter/material.dart';

import '../../../design_system/constants/constants_strings.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      centerTitle: true,
      title: Text(ConstantsStrings.todoListTitle),
    );
  }
}
