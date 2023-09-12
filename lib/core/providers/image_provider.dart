import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class AppImageProvider extends ChangeNotifier {
  Uint8List? _currentImage;

  onChangeImageFile(File image) {
    _currentImage = image.readAsBytesSync();
    notifyListeners();
  }

  onChangeImage(Uint8List image) {
    _currentImage = image;
    notifyListeners();
  }

  Uint8List? get currentImage => _currentImage;
}
