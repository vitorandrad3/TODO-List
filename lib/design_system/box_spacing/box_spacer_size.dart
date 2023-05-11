part of 'box_spacer.dart';

enum DSBoxSpacingSize { xs, s, m, l, xl }

extension StormLayoutSpacerSizeExtension on DSBoxSpacingSize {
  double get kSize {
    switch (this) {
      case DSBoxSpacingSize.xs:
        return DSSpacing.xSmall;
      case DSBoxSpacingSize.s:
        return DSSpacing.small;
      case DSBoxSpacingSize.m:
        return DSSpacing.medium;
      case DSBoxSpacingSize.l:
        return DSSpacing.large;
      case DSBoxSpacingSize.xl:
        return DSSpacing.xLarge;
      // ignore: no_default_cases
      default:
        return DSSpacing.medium;
    }
  }
}
