import 'package:colorfilter_generator/addons.dart';
import 'package:colorfilter_generator/colorfilter_generator.dart';
import 'package:flutter/cupertino.dart';

class AdjustProvider extends ChangeNotifier {
  late ColorFilterGenerator adj;

  double brightness = 0;
  double contrast = 0;
  double saturation = 0;
  double hue = 0;
  double sepia = 0;

  adjustImage({b, c, s, h, se}) {
    adj = ColorFilterGenerator(
      name: 'Adjust',
      filters: [
        ColorFilterAddons.brightness(b ?? brightness),
        ColorFilterAddons.contrast(c ?? contrast),
        ColorFilterAddons.saturation(s ?? saturation),
        ColorFilterAddons.hue(h ?? hue),
        ColorFilterAddons.sepia(se ?? sepia),
      ],
    );
    notifyListeners();
  }

  changeBrightness(double value) {
    brightness = value;
    notifyListeners();
  }
}
