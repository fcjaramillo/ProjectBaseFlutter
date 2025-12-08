part of 'atoms.dart';

class Spacing {
  Spacing._();

  static Widget get spacingV2 => const SizedBox(height: Layout.spaceXXS);
  static Widget get spacingV4 => const SizedBox(height: Layout.spaceXS);
  static Widget get spacingV8 => const SizedBox(height: Layout.spaceS);
  static Widget get spacingV12 => const SizedBox(height: Layout.spaceM);
  static Widget get spacingV16 => const SizedBox(height: Layout.spaceML);
  static Widget get spacingV24 => const SizedBox(height: Layout.spaceL);
  static Widget get spacingV32 => const SizedBox(height: Layout.spaceXL);
  static Widget get spacingV48 => const SizedBox(height: Layout.spaceXXL);
  static Widget get spacingV96 => const SizedBox(height: Layout.spaceXXXL);

  static Widget get spacingH2 => const SizedBox(width: Layout.spaceXXS);
  static Widget get spacingH4 => const SizedBox(width: Layout.spaceXS);
  static Widget get spacingH8 => const SizedBox(width: Layout.spaceS);
  static Widget get spacingH12 => const SizedBox(width: Layout.spaceM);
  static Widget get spacingH16 => const SizedBox(width: Layout.spaceML);
  static Widget get spacingH24 => const SizedBox(width: Layout.spaceL);
  static Widget get spacingH32 => const SizedBox(width: Layout.spaceXL);
  static Widget get spacingH48 => const SizedBox(width: Layout.spaceXXL);
  static Widget get spacingH96 => const SizedBox(width: Layout.spaceXXXL);
}
