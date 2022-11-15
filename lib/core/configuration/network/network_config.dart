import 'package:news_app/flavors.dart';



class IPAddress {
  static const String DEV = 'newsapi.org/';
  static const String LIVE = 'newsapi.org/';
}

class ServerProtocol {
  static const String DEV = 'https://';
  static const String LIVE = 'https://';
}

class ContextRoot {
  static const String DEV = 'v2/';
  static const String LIVE = 'v2/';
}

class NetworkConfig {
  static String getNetworkUrl() {
    String url = _getProtocol() + _getIP() + _getContextRoot();
    return url;
  }

  static String _getContextRoot() {
    if (F.name == Flavor.DEV.name) {
      return ContextRoot.DEV;
    } else {
      return ContextRoot.LIVE;
    }
  }

  static String _getProtocol() {
    if (F.name == Flavor.DEV.name) {
      return ServerProtocol.DEV;
    } else {
      return ServerProtocol.LIVE;
    }
  }

  static String _getIP() {
    if (F.name == Flavor.DEV.name) {
      return IPAddress.DEV;
    } else {
      return IPAddress.LIVE;
    }
  }

  static const String APIKey = 'b457f9164bd24047bd2d9920f456c593';
}
