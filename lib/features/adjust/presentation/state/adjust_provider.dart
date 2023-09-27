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

  bool showBrightness = true;
  bool showContrast = false;
  bool showSaturation = false;
  bool showHue = false;
  bool showSepia = false;

  adjustImage({b, c, s, h, se}) {
    brightness = b ?? brightness;
    contrast = c ?? contrast;
    saturation = s ?? saturation;
    hue = h ?? hue;
    sepia = se ?? sepia;

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

  showSlider({b, c, s, h, se}) {
    showBrightness = b ?? false;
    showContrast = c ?? false;
    showSaturation = s ?? false;
    showHue = h ?? false;
    showSepia = se ?? false;
    notifyListeners();
  }
}
