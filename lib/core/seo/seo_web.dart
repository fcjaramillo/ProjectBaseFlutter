// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;

const String _defaultTitle =
    'William Campino - Payanes de Corazon | Candidato Alcaldia Popayan';
const String _defaultDescription =
    'William Campino, candidato a la Alcaldia de Popayan. Con compromiso, '
    'experiencia y amor por la tierra blanca, juntos construiremos la '
    'Popayan moderna, humana y sostenible que la ciudad merece.';
const String _defaultImage = 'https://williamcampiño.com/images/og-image.jpg';
const String _baseUrl = 'https://williamcampiño.com';

/// Update page title
void setTitle(String title) {
  html.document.title = '$title | William Campino';
}

/// Update meta description
void setDescription(String description) {
  _updateMetaTag('description', description);
  _updateMetaTag('og:description', description, isProperty: true);
  _updateMetaTag('twitter:description', description, isProperty: true);
}

/// Update Open Graph image
void setImage(String imageUrl) {
  _updateMetaTag('og:image', imageUrl, isProperty: true);
  _updateMetaTag('twitter:image', imageUrl, isProperty: true);
}

/// Update canonical URL
void setCanonicalUrl(String path) {
  final String fullUrl = '$_baseUrl$path';
  _updateMetaTag('og:url', fullUrl, isProperty: true);
  _updateMetaTag('twitter:url', fullUrl, isProperty: true);

  // Update canonical link
  final html.Element? canonical = html.document.querySelector(
    'link[rel="canonical"]',
  );
  if (canonical != null) {
    canonical.setAttribute('href', fullUrl);
  }
}

/// Set all SEO properties at once for a page
void setPageSeo({
  required String title,
  required String path,
  String? description,
  String? image,
}) {
  // Update title
  html.document.title = '$title | William Campino';
  _updateMetaTag('title', '$title | William Campino');
  _updateMetaTag('og:title', '$title | William Campino', isProperty: true);
  _updateMetaTag('twitter:title', '$title | William Campino', isProperty: true);

  // Update description
  final String desc = description ?? _defaultDescription;
  _updateMetaTag('description', desc);
  _updateMetaTag('og:description', desc, isProperty: true);
  _updateMetaTag('twitter:description', desc, isProperty: true);

  // Update image
  final String img = image ?? _defaultImage;
  _updateMetaTag('og:image', img, isProperty: true);
  _updateMetaTag('twitter:image', img, isProperty: true);

  // Update URL
  final String fullUrl = '$_baseUrl$path';
  _updateMetaTag('og:url', fullUrl, isProperty: true);
  _updateMetaTag('twitter:url', fullUrl, isProperty: true);

  // Update canonical
  final html.Element? canonical = html.document.querySelector(
    'link[rel="canonical"]',
  );
  if (canonical != null) {
    canonical.setAttribute('href', fullUrl);
  }
}

/// Reset to default SEO values
void resetToDefaults() {
  html.document.title = _defaultTitle;
  setDescription(_defaultDescription);
  setImage(_defaultImage);
  setCanonicalUrl('/');
}

/// Helper to update meta tags
void _updateMetaTag(String name, String content, {bool isProperty = false}) {
  final String selector = isProperty
      ? 'meta[property="$name"]'
      : 'meta[name="$name"]';

  html.Element? element = html.document.querySelector(selector);

  if (element != null) {
    element.setAttribute('content', content);
  } else {
    // Create meta tag if it doesn't exist
    final html.MetaElement meta = html.MetaElement();
    if (isProperty) {
      meta.setAttribute('property', name);
    } else {
      meta.name = name;
    }
    meta.content = content;
    html.document.head?.append(meta);
  }
}
