import 'package:flutter/material.dart';
import 'package:flutter_application_mary/ui/pages/create_groups_page.dart';
import 'package:flutter_application_mary/ui/pages/create_sesion_page.dart';
import 'package:flutter_application_mary/ui/theme/theme_controller.dart';
import 'package:flutter_application_mary/ui/widgets/appbar.dart';
import 'package:get/get.dart';


class Home_page extends StatefulWidget {
  @override
  State<Home_page> createState() => _MyNav();
}

class _MyNav extends State<Home_page> {
  final ThemeController controller = Get.find();
  int _paginaActual = 0;
  final List<Widget> _paginas = [
    Home_page(),
    CreateGroups(),
    CreateSesion(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //debugShowCheckedModeBanner: false,
      //title: 'Mintic',
      //home: Scaffold(
      appBar: CustomAppBar(
        controller: controller,
        tile: const Text("ProsperTv"),
        context: context,
      ),
      body: _paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.purple[700],
        type: BottomNavigationBarType.fixed,
        onTap: (posicion) {
          setState(() {
            _paginaActual = posicion;
          });
        },
        currentIndex: _paginaActual,
        items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: Icon(
              Icons.groups_outlined,
              key: ValueKey("groupsTab"),
            ),
            label: "Groups",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.more_time_outlined,
                key: ValueKey("sesionsTab"),
              ),
              label: "Sesions")
        ],
      ),
    );
  }
}