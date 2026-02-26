// Stub implementation for non-web platforms
// All methods are no-ops since SEO only applies to web

void setTitle(String title) {}

void setDescription(String description) {}

void setImage(String imageUrl) {}

void setCanonicalUrl(String path) {}

void setPageSeo({
  required String title,
  required String path,
  String? description,
  String? image,
}) {}

void resetToDefaults() {}
