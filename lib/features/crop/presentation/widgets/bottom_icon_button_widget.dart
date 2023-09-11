import 'package:flutter/material.dart';

class BottomIconButtonWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const BottomIconButtonWidget({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
