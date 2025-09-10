part of '../entities.dart';

class EnvVariables {
  Environment? _env;
  FontDeviceSize? _deviceSize;
  bool? isLoggedIn;

  static final EnvVariables _instance = EnvVariables._internal();

  EnvVariables._internal();

  static EnvVariables get instance => _instance;

  Environment get env {
    if (_env == null) {
      _customError('env');
    }
    return _env ?? Environment.production;
  }

  FontDeviceSize get deviceSize {
    if (_deviceSize == null) {
      _customError('deviceSize');
    }
    return _deviceSize ?? FontDeviceSize.medium;
  }

  void setEnv(Environment env) => _env = env;

  void setFontDeviceSize(double width) {
    if (width < 400) {
      _deviceSize = FontDeviceSize.small;
    } else if (width < 600) {
      _deviceSize = FontDeviceSize.medium;
    } else {
      _deviceSize = FontDeviceSize.large;
    }
  }

  void _customError(String field) {
    log(
      '********************* WARNING *********************\n'
      'the field EnvVariables.instance.$field isnt initialized yet\n'
      '*****************************************************',
    );
    if (env == Environment.production) {
      Exception('the field EnvVariables.instance.$field isnt initialized yet');
    }
  }
}
