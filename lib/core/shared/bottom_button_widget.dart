import 'package:flutter/material.dart';

class BottomButtonWidget extends StatelessWidget {
  final bool isSelected;

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const BottomButtonWidget({
    Key? key,
    this.isSelected = false,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.white,
            ),
            const SizedBox(height: 3),
            Text(
              title.trim(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isSelected
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.white70,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
