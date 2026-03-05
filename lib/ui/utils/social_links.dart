part of 'utils.dart';

abstract final class SocialLinks {
  static const String facebook =
      'https://www.facebook.com/williamcampino/';
  static const String instagram =
      'https://www.instagram.com/williamcampino/';
  static const String twitter = 'https://x.com/WilliamCampino';
  static const String youtube =
      'https://www.youtube.com/@williamcampino5296';
}

Future<void> launchSocialUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

Future<void> shareOnFacebook(String pageUrl) => launchSocialUrl(
  'https://www.facebook.com/sharer/sharer.php'
  '?u=${Uri.encodeComponent(pageUrl)}',
);

Future<void> shareOnTwitter(String text, String pageUrl) => launchSocialUrl(
  'https://twitter.com/intent/tweet'
  '?text=${Uri.encodeComponent(text)}'
  '&url=${Uri.encodeComponent(pageUrl)}',
);

Future<void> shareOnWhatsApp(String text) => launchSocialUrl(
  'https://wa.me/?text=${Uri.encodeComponent(text)}',
);

/// Iconos de redes sociales usando FontAwesome (marca oficial).
enum SocialNetwork { facebook, instagram, twitter, youtube }

Widget socialIcon({
  required SocialNetwork network,
  required Color color,
  double size = 24,
}) {
  final IconData icon = switch (network) {
    SocialNetwork.facebook => FontAwesomeIcons.facebookF,
    SocialNetwork.instagram => FontAwesomeIcons.instagram,
    SocialNetwork.twitter => FontAwesomeIcons.xTwitter,
    SocialNetwork.youtube => FontAwesomeIcons.youtube,
  };
  return FaIcon(icon, color: color, size: size * 0.85);
}
