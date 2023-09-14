import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:photo_editor/features/filter/data/local/filter_data.dart';

class AppImageProvider extends ChangeNotifier {
  Uint8List? _currentImage;

  List<double> _currentFilter = FilterData.filterList[0].matrix;

  onChangeImageFile(File image) {
    _currentImage = image.readAsBytesSync();
    notifyListeners();
  }

  onChangeImage(Uint8List image) {
    _currentImage = image;
    notifyListeners();
  }

  Uint8List? get currentImage => _currentImage;

  onChangeFilter(List<double> filterData) {
    _currentFilter = filterData;
    notifyListeners();
  }

  List<double> get currentFilter => _currentFilter;
}
