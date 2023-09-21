import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;

  final IconData actionIcon;
  final VoidCallback actionPressed;

  const CustomAppBarWidget({
    Key? key,
    required this.title,
    this.onBackPressed,
    required this.actionIcon,
    required this.actionPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CloseButton(
        color: Colors.white,
        onPressed: onBackPressed ??
            () {
              Navigator.pop(context);
            },
      ),
      title: Text(title),
      actions: [
        IconButton(
          onPressed: actionPressed,
          icon: Icon(actionIcon),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
