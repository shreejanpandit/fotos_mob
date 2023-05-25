import 'package:flutter/foundation.dart';

class DrawerViewModel extends ChangeNotifier {
  ValueNotifier<bool> drawerOpenNotifier = ValueNotifier<bool>(false);

  void toggleDrawer() {
    drawerOpenNotifier.value = !drawerOpenNotifier.value;
  }
}
