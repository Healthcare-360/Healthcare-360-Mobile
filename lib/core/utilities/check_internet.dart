import 'package:connectivity_plus/connectivity_plus.dart';

enum InternetStatus { none, connected, notConnected }

class CheckInternet {
  static Future<InternetStatus> check() async {
    InternetStatus status = InternetStatus.none;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      status = InternetStatus.connected;
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      status = InternetStatus.connected;

      // I am connected to a wifi network.
    } else {
      status = InternetStatus.notConnected;

      // No internet
    }
    return status;
  }
}
