part of 'organisms.dart';

class CampaignMapMarker {
  const CampaignMapMarker({
    required this.latitude,
    required this.longitude,
    required this.label,
    this.color,
    this.onTap,
  });

  final double latitude;
  final double longitude;
  final String label;
  final Color? color;
  final VoidCallback? onTap;
}

class CampaignMap extends StatelessWidget {
  const CampaignMap({
    required this.latitude,
    required this.longitude,
    super.key,
    this.height = 300,
    this.zoom = 15.0,
    this.markerColor,
    this.popupLabel,
  });

  final double latitude;
  final double longitude;
  final double height;
  final double zoom;
  final Color? markerColor;
  final String? popupLabel;

  @override
  Widget build(BuildContext context) {
    final Color pinColor =
        markerColor ?? Theme.of(context).appColors.primary.strong;
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: height,
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(latitude, longitude),
            initialZoom: zoom,
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.all,
            ),
          ),
          children: <Widget>[
            TileLayer(
              urlTemplate:
                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.williamcampino.app',
            ),
            MarkerLayer(
              markers: <Marker>[
                Marker(
                  point: LatLng(latitude, longitude),
                  width: 40,
                  height: 40,
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.location_pin,
                      color: pinColor,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CampaignMapWithMarkers extends StatelessWidget {
  const CampaignMapWithMarkers({
    required this.markers,
    required this.center,
    super.key,
    this.height = 400,
    this.zoom = 13.0,
    this.selectedLabel,
  });

  final List<CampaignMapMarker> markers;
  final LatLng center;
  final double height;
  final double zoom;
  final String? selectedLabel;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: height,
          child: FlutterMap(
            options: MapOptions(
              initialCenter: center,
              initialZoom: zoom,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all,
              ),
            ),
            children: <Widget>[
              TileLayer(
                urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.williamcampino.app',
              ),
              MarkerLayer(
                markers: markers
                    .map(
                      (CampaignMapMarker m) => Marker(
                        point: LatLng(m.latitude, m.longitude),
                        width: selectedLabel == m.label ? 48 : 36,
                        height: selectedLabel == m.label ? 48 : 36,
                        child: GestureDetector(
                          onTap: m.onTap,
                          child: Icon(
                            Icons.location_pin,
                            color: m.color ??
                                Theme.of(context).appColors.primary.strong,
                            size: selectedLabel == m.label ? 48 : 36,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
}
