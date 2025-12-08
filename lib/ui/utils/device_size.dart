part of 'utils.dart';

enum DeviceSize { small, mediumSmall, medium, mediumTall, tall, huge }

class DeviceSizeHelper {
  static DeviceSize getDeviceSize(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    const double smallThreshold = 600;
    const double mediumSmallThreshold = 721;
    const double medium = 841;
    const double mediumLargeThreshold = 940;
    const double tallThreshold = 1020;

    if (height < smallThreshold) {
      return DeviceSize.small;
    } else if (height < mediumSmallThreshold) {
      return DeviceSize.mediumSmall;
    } else if (height < medium) {
      return DeviceSize.medium;
    } else if (height < mediumLargeThreshold) {
      return DeviceSize.mediumTall;
    } else if (height < tallThreshold) {
      return DeviceSize.tall;
    } else {
      return DeviceSize.huge;
    }
  }
}
