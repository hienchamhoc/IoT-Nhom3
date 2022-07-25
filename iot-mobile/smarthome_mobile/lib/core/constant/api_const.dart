import 'package:smarthome_mobile/configs/env_config.dart';

class APIConst {
  static String _baseUrl = "";

  static String get baseUrl => _baseUrl;

  static void setBaseUrl(Environment env) {
    switch (env) {
      case Environment.local:
        _baseUrl = EnvConfig.baseUrlLocal;
        break;
      case Environment.production:
        _baseUrl = EnvConfig.baseUrlProduction;
        break;
      case Environment.realDevice:
        _baseUrl = EnvConfig.baseUrlRealDevice;
        break;
      default:
        _baseUrl = EnvConfig.baseUrlLocal;
        break;
    }
  }
}

enum Environment {
  local,
  production,
  realDevice,
}
