import 'package:flutter/material.dart';

class CustomSliderWidget extends StatelessWidget {
  final double value;

  final Function(double)? onChanged;

  const CustomSliderWidget({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(
      label: value.toStringAsFixed(2),
      max: 1,
      min: -0.9,
      value: value,
      onChanged: onChanged,
    );
  }
}
