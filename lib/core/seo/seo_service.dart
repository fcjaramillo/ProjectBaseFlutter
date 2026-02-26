import 'seo_stub.dart' if (dart.library.html) 'seo_web.dart' as seo_impl;

/// SEO Service for updating meta tags dynamically in Flutter Web
/// Uses conditional imports to work on both web and mobile platforms
class SeoService {
  SeoService._();

  /// Update page title
  static void setTitle(String title) => seo_impl.setTitle(title);

  /// Update meta description
  static void setDescription(String description) =>
      seo_impl.setDescription(description);

  /// Update Open Graph image
  static void setImage(String imageUrl) => seo_impl.setImage(imageUrl);

  /// Update canonical URL
  static void setCanonicalUrl(String path) => seo_impl.setCanonicalUrl(path);

  /// Set all SEO properties at once for a page
  static void setPageSeo({
    required String title,
    required String path,
    String? description,
    String? image,
  }) => seo_impl.setPageSeo(
    title: title,
    description: description,
    image: image,
    path: path,
  );

  /// Reset to default SEO values
  static void resetToDefaults() => seo_impl.resetToDefaults();
}

/// SEO configuration for each route
class PageSeoConfig {
  const PageSeoConfig({
    required this.title,
    required this.path,
    this.description,
    this.image,
  });

  final String title;
  final String? description;
  final String? image;
  final String path;
}

/// Predefined SEO configurations for main pages
class SeoConfigs {
  SeoConfigs._();

  static const PageSeoConfig home = PageSeoConfig(
    title: 'Inicio',
    path: '/',
    description:
        'William Campino, candidato a la Alcaldia de Popayan. Payanes de '
        'corazon. Juntos construiremos una ciudad moderna y sostenible.',
  );

  static const PageSeoConfig candidate = PageSeoConfig(
    title: 'Sobre William Campino',
    path: '/candidato',
    description:
        'Conoce a William Campino, su trayectoria, valores y compromiso con '
        'Popayan. Mas de 24 años de servicio a la comunidad.',
  );

  static const PageSeoConfig lifeStory = PageSeoConfig(
    title: 'Mi Vida - Linea de Tiempo',
    path: '/mi-vida',
    description:
        'La historia de William Campino: desde sus inicios hasta su '
        'candidatura a la Alcaldia de Popayan.',
  );

  static const PageSeoConfig vision = PageSeoConfig(
    title: 'Vision de Ciudad',
    path: '/vision',
    description:
        'Nuestra vision para Popayan: una ciudad moderna, humana y sostenible '
        'que respeta su patrimonio mientras mira hacia el futuro.',
  );

  static const PageSeoConfig strategicAxes = PageSeoConfig(
    title: 'Ejes Estrategicos',
    path: '/ejes',
    description:
        'Los pilares fundamentales de nuestro plan de gobierno: seguridad, '
        'economia, educacion, salud, movilidad y cultura.',
  );

  static const PageSeoConfig proposals = PageSeoConfig(
    title: 'Propuestas',
    path: '/propuestas',
    description:
        'Conoce las propuestas de William Campino para transformar Popayan. '
        'Plan de gobierno detallado por areas estrategicas.',
  );

  static const PageSeoConfig citizenInvestment = PageSeoConfig(
    title: 'Tu Popayan - Calculadora de Inversion',
    path: '/tu-popayan',
    description:
        'Decide como invertir el presupuesto de Popayan. Conoce los proyectos '
        'y prioriza segun las necesidades de tu comunidad.',
  );

  static const PageSeoConfig endorsements = PageSeoConfig(
    title: 'Apoyos y Respaldos',
    path: '/apoyos',
    description:
        'Conoce quienes apoyan a William Campino. Testimonios de lideres '
        'comunales, empresarios y ciudadanos.',
  );

  static const PageSeoConfig events = PageSeoConfig(
    title: 'Agenda de Eventos',
    path: '/agenda',
    description:
        'Proximos eventos de la campana de William Campino. Encuentros con '
        'la comunidad, debates y actividades.',
  );

  static const PageSeoConfig support = PageSeoConfig(
    title: 'Como Apoyar',
    path: '/apoyar',
    description:
        'Unete al equipo de William Campino. Se voluntario, dona a la campana '
        'o comparte nuestro mensaje.',
  );

  static const PageSeoConfig news = PageSeoConfig(
    title: 'Noticias',
    path: '/noticias',
    description:
        'Ultimas noticias de la campana de William Campino. Comunicados, '
        'actividades y cobertura de medios.',
  );

  static const PageSeoConfig media = PageSeoConfig(
    title: 'Galeria Multimedia',
    path: '/galeria',
    description:
        'Fotos y videos de la campana de William Campino. Momentos con la '
        'comunidad y eventos destacados.',
  );

  static const PageSeoConfig contact = PageSeoConfig(
    title: 'Contacto',
    path: '/contacto',
    description:
        'Contacta a la campana de William Campino. Envianos tus ideas, '
        'propuestas o solicita informacion.',
  );

  static const PageSeoConfig territory = PageSeoConfig(
    title: 'Territorio - Comunas de Popayan',
    path: '/territorio',
    description:
        'Propuestas especificas para cada comuna de Popayan. Conoce las '
        'prioridades de tu barrio.',
  );
}
