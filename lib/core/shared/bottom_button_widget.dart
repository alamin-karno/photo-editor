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
    return Container(
      width: 80,
      color: isSelected ? Colors.white10 : null,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isSelected
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.white70,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
