import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_mary/ui/theme/theme_controller.dart';


import 'package:flutter_application_mary/ui/pages/login_page.dart';

class CustomAppBar extends AppBar {
  final Widget tile;
  final BuildContext context;
  final ThemeController controller;

  // Creating a custom AppBar that extends from Appbar with super();
  CustomAppBar({
    Key? key,
    required this.controller,
    required this.context,
    required this.tile,
  }) : super(
          key: key,
          centerTitle: true,
          title: tile,
          leading: IconButton(
            icon: Obx(
              () => Icon(
                controller.darkMode
                    ? Icons.light_mode_rounded
                    : Icons.dark_mode_rounded,
              ),
            ),
            onPressed: () => controller.darkMode = !controller.darkMode,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.off(() => const LoginPage());
                },
                icon: const Icon(Icons.logout)),
          ],
          backgroundColor: const Color.fromARGB(255, 83, 68, 145),
        );
}