import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerModel extends ChangeNotifier {
  File? _pickedImage;
  File? get pickedImage => _pickedImage;
  String? imageName;
  String? _base64String;

  String? get base64String => _base64String;

  // set uploadImage(File? file) => file;

  Future<void> pickImage(ImageSource source) async {
    try {
      final image = ImagePicker();
      final pickedImage = await image.pickImage(source: source);
      if (pickedImage != null) {
        var data = File(pickedImage.path);
        print(data);
        _pickedImage = await cropImage(imageFile: data);
        print(_pickedImage);
        imageName = pickedImage.path.split('/').last;
        List<int> imageBytes = File(_pickedImage!.path).readAsBytesSync();
        _base64String = base64Encode(imageBytes);
        notifyListeners();
      } else {
        _pickedImage = null;
      }
    } on PlatformException catch (e) {
      print('Failed to pick an image: $e');
    }
  }

  Future<File?> cropImage({required File imageFile}) async {
    try {
      CroppedFile? cropedImage =
          await ImageCropper().cropImage(sourcePath: imageFile.path);
      if (cropedImage == null) {
        return null;
      }
      return File(cropedImage.path);
    } on PlatformException catch (e) {
      print('Failed to pick an image: $e');
    }
    return null;
  }

  bool isWeb() {
    return kIsWeb;
  }
}
