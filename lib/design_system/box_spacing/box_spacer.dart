import 'package:flutter/material.dart';

import '../constants/spacing.dart';

part 'box_spacer_size.dart';

class DSBoxSpacing extends SizedBox {
  const DSBoxSpacing({super.key}) : super.square(dimension: DSSpacing.medium);

  const DSBoxSpacing.xxSmall({super.key})
      : super.square(dimension: DSSpacing.xxSmall);

  const DSBoxSpacing.xSmall({super.key})
      : super.square(dimension: DSSpacing.xSmall);

  const DSBoxSpacing.small({super.key})
      : super.square(dimension: DSSpacing.small);

  const DSBoxSpacing.large({super.key})
      : super.square(dimension: DSSpacing.large);

  const DSBoxSpacing.xLarge({super.key})
      : super.square(dimension: DSSpacing.xLarge);

  const DSBoxSpacing.xxLarge({super.key})
      : super.square(dimension: DSSpacing.xxLarge);

  DSBoxSpacing.custom({required DSBoxSpacingSize size, super.key})
      : super.square(dimension: size.kSize);
}
