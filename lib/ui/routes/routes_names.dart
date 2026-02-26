part of 'routes.dart';

class Routes {
  Routes._();

  // Main routes
  static const String home = '/';
  static const String candidate = '/candidato';
  static const String lifeStory = '/mi-vida';
  static const String vision = '/vision';
  static const String strategicAxes = '/ejes';
  static const String proposals = '/propuestas';
  static const String proposalDetail = '/propuestas/:id';
  static const String citizenInvestment = '/tu-popayan';
  static const String endorsements = '/apoyos';
  static const String events = '/agenda';
  static const String eventDetail = '/agenda/:id';
  static const String support = '/apoyar';
  static const String news = '/noticias';
  static const String newsDetail = '/noticias/:id';
  static const String media = '/galeria';
  static const String contact = '/contacto';
  static const String territory = '/territorio';
  static const String communeDetail = '/territorio/:id';

  // Legacy route for compatibility
  static const String kRouteHome = '/home';
}
