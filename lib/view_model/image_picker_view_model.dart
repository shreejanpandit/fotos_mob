// import 'package:flutter/foundation.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagePickerModel extends ChangeNotifier {
//   XFile? _pickedImage;

//   XFile? get pickedImage => _pickedImage;

//   Future<void> pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     _pickedImage = await picker.pickImage(source: source);
//     notifyListeners();
//   }
// }

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerModel extends ChangeNotifier {
  File? _pickedImage;

  File? get pickedImage => _pickedImage;

  Future<void> pickImage(ImageSource source) async {
    try {
      final image = ImagePicker();
      final pickedImage = await image.pickImage(source: source);
      if (pickedImage != null) {
        _pickedImage = File(pickedImage.path);
        notifyListeners();
      } else {
        _pickedImage = null;
      }
    } on PlatformException catch (e) {
      print('Failed to pick an image: $e');
    }
  }

  bool isWeb() {
    return kIsWeb;
  }
}
