import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class AppImageProvider extends ChangeNotifier {
  Uint8List? _currentImage;

  onChangeImage(File image) {
    _currentImage = image.readAsBytesSync();
    notifyListeners();
  }

  Uint8List? get currentImage => _currentImage;
}
