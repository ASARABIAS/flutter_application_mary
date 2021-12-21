import 'package:flutter/material.dart';
import 'package:flutter_application_mary/ui/pages/create_groups_page.dart';
import 'package:flutter_application_mary/ui/pages/Home_page.dart';
import 'package:flutter_application_mary/ui/pages/create_sesion_page.dart';
import 'package:flutter_application_mary/ui/theme/theme_controller.dart';
import 'package:flutter_application_mary/ui/theme/theme_manager.dart';
import 'package:flutter_application_mary/ui/widgets/appbar.dart';
import 'package:get/get.dart';


class Nav_page extends StatefulWidget {
  
  @override
  State<Nav_page> createState() => _Navstate();
}

class _Navstate extends State<Nav_page> {
  late final ThemeController controllerr = Get.put(ThemeController());
  int _paginaActual = 0;
  final List<Widget> _paginas = [
    const CreateGroups(),
    const CreateSesion(),
  ];

  late final ThemeManager manager = ThemeManager();
  bool isLoaded = false;


  Future<void> initializeTheme() async {  
    controllerr.darkMode = await manager.storedTheme;
    setState(() => isLoaded = true);
  }
  
  @override
  void initState() {
    ever(controllerr.reactiveDarkMode, (bool isDarkMode) {
      manager.changeTheme(isDarkMode: isDarkMode);
    });
    initializeTheme();
    super.initState();
  }

_onItemTapped(int index) {
    setState(() {
      _paginaActual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: CustomAppBar(
        controller: controllerr,
        tile: const Text("Gestion tutorias"),
        context: context,
      ),
      body: _paginas.elementAt(_paginaActual),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _paginaActual,
        onTap: _onItemTapped,
      ),
    );
  }
}