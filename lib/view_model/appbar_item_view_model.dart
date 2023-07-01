import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppbarViewModel extends ChangeNotifier {
  ValueNotifier<bool> drawerOpenNotifier = ValueNotifier<bool>(false);

  void toggleDrawer() {
    drawerOpenNotifier.value = !drawerOpenNotifier.value;
  }

  bool showBody = true;

  void toggleBody() {
    showBody = !showBody;
    notifyListeners();
  }
}
