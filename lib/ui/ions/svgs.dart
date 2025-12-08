part of 'ions.dart';

class Svgs {
  Svgs._();
  static String logoHorizontal(Brightness brightness) =>
      brightness == Brightness.light
      ? 'assets/svg/logo_horizontal_dark.svg'
      : 'assets/svg/logo_horizontal.svg';

  static String emptyState(Brightness brightness) =>
      brightness == Brightness.light
      ? 'packages/search/assets/svg/empty_state_dark.svg'
      : 'packages/search/assets/svg/empty_state.svg';

  static const String crown = 'packages/search/assets/svg/crown.svg';
  static const String emptyImage = 'packages/search/assets/svg/empty_image.svg';
  static const String mealType = 'packages/search/assets/svg/restaurants.svg';
  static const String navBarLogo =
      'packages/salesboard/assets/svg/nav_bar_logo.svg';
}
