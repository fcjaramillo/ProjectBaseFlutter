part of 'ions.dart';

class BasePadding {
  BasePadding._();

  static EdgeInsetsGeometry get padding_1 => const EdgeInsets.all(1);
  static EdgeInsetsGeometry get paddingH2 =>
      const EdgeInsets.symmetric(horizontal: Layout.spaceXXS);
  static EdgeInsetsGeometry get paddingV2 =>
      const EdgeInsets.symmetric(vertical: Layout.spaceXXS);
  static EdgeInsetsGeometry get padding_2 =>
      const EdgeInsets.all(Layout.spaceXXS);

  static EdgeInsetsGeometry get paddingH4 =>
      const EdgeInsets.symmetric(horizontal: Layout.spaceXS);
  static EdgeInsetsGeometry get paddingV4 =>
      const EdgeInsets.symmetric(vertical: Layout.spaceXS);
  static EdgeInsetsGeometry get padding_4 =>
      const EdgeInsets.all(Layout.spaceXS);

  static EdgeInsetsGeometry get paddingH8 =>
      const EdgeInsets.symmetric(horizontal: Layout.spaceS);
  static EdgeInsetsGeometry get paddingV8 =>
      const EdgeInsets.symmetric(vertical: Layout.spaceS);
  static EdgeInsetsGeometry get padding_8 =>
      const EdgeInsets.all(Layout.spaceS);

  static EdgeInsets get paddingH12 =>
      const EdgeInsets.symmetric(horizontal: Layout.spaceM);
  static EdgeInsetsGeometry get paddingV12 =>
      const EdgeInsets.symmetric(vertical: Layout.spaceM);
  static EdgeInsetsGeometry get padding_12 =>
      const EdgeInsets.all(Layout.spaceM);

  static EdgeInsets get paddingH16 =>
      const EdgeInsets.symmetric(horizontal: Layout.spaceML);
  static EdgeInsetsGeometry get paddingV16 =>
      const EdgeInsets.symmetric(vertical: Layout.spaceML);
  static EdgeInsets get padding_16 => const EdgeInsets.all(Layout.spaceML);

  static EdgeInsetsGeometry get paddingH20 =>
      const EdgeInsets.symmetric(horizontal: 20);
  static EdgeInsetsGeometry get paddingV20 =>
      const EdgeInsets.symmetric(vertical: 20);
  static EdgeInsetsGeometry get padding_20 => const EdgeInsets.all(20);

  static EdgeInsetsGeometry get paddingH24 =>
      const EdgeInsets.symmetric(horizontal: Layout.spaceL);
  static EdgeInsetsGeometry get paddingV24 =>
      const EdgeInsets.symmetric(vertical: Layout.spaceL);
  static EdgeInsetsGeometry get padding_24 =>
      const EdgeInsets.all(Layout.spaceL);

  static EdgeInsetsGeometry get paddingH32 =>
      const EdgeInsets.symmetric(horizontal: Layout.spaceXL);
  static EdgeInsetsGeometry get paddingV32 =>
      const EdgeInsets.symmetric(vertical: Layout.spaceXL);
  static EdgeInsetsGeometry get padding_32 =>
      const EdgeInsets.all(Layout.spaceXL);

  static EdgeInsetsGeometry get paddingH48 =>
      const EdgeInsets.symmetric(horizontal: Layout.spaceXXL);
  static EdgeInsetsGeometry get paddingV48 =>
      const EdgeInsets.symmetric(vertical: Layout.spaceXXL);
  static EdgeInsetsGeometry get padding_48 =>
      const EdgeInsets.all(Layout.spaceXXL);

  static EdgeInsetsGeometry get paddingH96 =>
      const EdgeInsets.symmetric(horizontal: Layout.spaceXXXL);
  static EdgeInsetsGeometry get paddingV96 =>
      const EdgeInsets.symmetric(vertical: Layout.spaceXXXL);
  static EdgeInsetsGeometry get padding_96 =>
      const EdgeInsets.all(Layout.spaceXXXL);

  static EdgeInsetsGeometry get paddingH16V8 => const EdgeInsets.symmetric(
        horizontal: Layout.spaceML,
        vertical: Layout.spaceS,
      );
  static EdgeInsetsGeometry get paddingH24V8 => const EdgeInsets.symmetric(
        horizontal: Layout.spaceL,
        vertical: Layout.spaceS,
      );
  static EdgeInsetsGeometry get paddingH32V8 => const EdgeInsets.symmetric(
        horizontal: Layout.spaceXL,
        vertical: Layout.spaceS,
      );
  static const EdgeInsetsGeometry paddingH8V4 = EdgeInsets.symmetric(
    horizontal: Layout.spaceS,
    vertical: Layout.spaceXS,
  );
  static EdgeInsetsGeometry get paddingH8V12 => const EdgeInsets.symmetric(
        horizontal: Layout.spaceS,
        vertical: Layout.spaceM,
      );

  static EdgeInsetsGeometry get paddingH12V8 => const EdgeInsets.symmetric(
        vertical: Layout.spaceS,
        horizontal: Layout.spaceM,
      );

  static EdgeInsetsGeometry get paddingH24V16 => const EdgeInsets.only(
        top: Layout.spaceML,
        bottom: Layout.spaceML,
        right: Layout.spaceL,
        left: Layout.spaceL,
      );

  static EdgeInsetsGeometry get defaultScreen => paddingH24V8;

  static const EdgeInsets paddingH16V12 = EdgeInsets.symmetric(
    horizontal: Layout.spaceML,
    vertical: Layout.spaceM,
  );

  static EdgeInsetsGeometry get paddingH12V4 => const EdgeInsets.symmetric(
        horizontal: Layout.spaceM,
        vertical: Layout.spaceXS,
      );
  static EdgeInsetsGeometry get paddingH12V16 => const EdgeInsets.symmetric(
        horizontal: Layout.spaceM,
        vertical: Layout.spaceML,
      );
  static EdgeInsetsGeometry get paddingH16V24 => const EdgeInsets.symmetric(
        horizontal: Layout.spaceML,
        vertical: Layout.spaceL,
      );
  static EdgeInsetsGeometry get paddingH16V24B12 => const EdgeInsets.only(
        left: Layout.spaceML,
        top: Layout.spaceL,
        right: Layout.spaceML,
        bottom: Layout.spaceM,
      );
  static EdgeInsetsGeometry get paddingH16V16B0 => const EdgeInsets.only(
        left: Layout.spaceML,
        top: Layout.spaceML,
        right: Layout.spaceML,
      );
  static EdgeInsetsGeometry get paddingH24V24T0 => const EdgeInsets.only(
        left: Layout.spaceL,
        right: Layout.spaceL,
        bottom: Layout.spaceL,
      );

  static EdgeInsetsGeometry get paddingH4V8 => const EdgeInsets.symmetric(
        horizontal: Layout.spaceXS,
        vertical: Layout.spaceS,
      );
  static EdgeInsetsGeometry get paddingL24 => const EdgeInsets.only(
        left: Layout.spaceL,
      );
  static EdgeInsetsGeometry get paddingT8B12L8R8 => const EdgeInsets.only(
        left: Layout.spaceS,
        top: Layout.spaceXL,
        right: Layout.spaceS,
        bottom: Layout.spaceL,
      );
}
