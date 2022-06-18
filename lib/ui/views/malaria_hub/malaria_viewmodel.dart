import 'package:flutter/foundation.dart';

class MalariaViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setState(bool state) {
    _loading = state;
    notifyListeners();
  }
}
