part of 'ions.dart';

class BaseRadius {
  const BaseRadius._();

  static const BorderRadius r_1 = BorderRadius.all(
    Radius.circular(
      Layout.spaceXS,
    ),
  );

  static const BorderRadius r_2 = BorderRadius.all(
    Radius.circular(
      Layout.spaceS,
    ),
  );

  static const BorderRadius rT2 = BorderRadius.vertical(
    top: Radius.circular(
      Layout.spaceS,
    ),
  );

  static const BorderRadius r_3 = BorderRadius.all(
    Radius.circular(
      Layout.spaceM,
    ),
  );

  static const BorderRadius r_4 = BorderRadius.all(
    Radius.circular(
      Layout.spaceML,
    ),
  );

  static const BorderRadius rRl1 = BorderRadius.only(
    topRight: Radius.circular(
      Layout.spaceXS,
    ),
    bottomLeft: Radius.circular(
      Layout.spaceXS,
    ),
  );

  static const BorderRadius rRl2 = BorderRadius.only(
    topRight: Radius.circular(
      Layout.spaceS,
    ),
    bottomLeft: Radius.circular(
      Layout.spaceS,
    ),
  );

  static const BorderRadius rrL2 = BorderRadius.only(
    bottomRight: Radius.circular(
      Layout.spaceS,
    ),
    topLeft: Radius.circular(
      Layout.spaceS,
    ),
  );

  static const BorderRadius circular = BorderRadius.all(
    Radius.circular(
      100,
    ),
  );

  static const BorderRadius rXl = BorderRadius.all(
    Radius.circular(
      Layout.spaceL,
    ),
  );

  static const BorderRadius detailsCarrouselImage = BorderRadius.only(
    topLeft: Radius.circular(1),
    topRight: Radius.circular(1),
    bottomLeft: Radius.circular(1),
    bottomRight: Radius.circular(1),
  );

  static const BorderRadius rTop_2 = BorderRadius.only(
    topRight: Radius.circular(
      Layout.spaceS,
    ),
    topLeft: Radius.circular(
      Layout.spaceS,
    ),
  );
}
