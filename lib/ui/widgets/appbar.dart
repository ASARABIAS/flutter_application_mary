import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final Widget tile;
  final BuildContext context;
  final VoidCallback onLogout;

  // Creating a custom AppBar that extends from Appbar with super();
  CustomAppBar({
    Key? key,
    required this.context,
    required this.tile,
    required this.onLogout,
  }) : super(
          key: key,
          centerTitle: true,
          title: tile,
          actions: [
            IconButton(
              key: const ValueKey("logoutAction"),
              icon: const Icon(Icons.exit_to_app),
              onPressed: onLogout,
            ),
            IconButton(
              key: const ValueKey("logoutAction"),
              icon: const Icon(Icons.exit_to_app),
              onPressed: onLogout,
            ),
          ],
        );
}
