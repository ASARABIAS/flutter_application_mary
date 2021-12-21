import 'package:flutter/material.dart';
import 'package:flutter_application_mary/ui/pages/Home_page.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);
  

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _user = '', _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 230, 230, 1.0),
      body: Container(
        //decoration: BoxDecoration(border: Border.all(color: Colors.green)),
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            childText('Gestión de Tutorias \n Inicio de Sesion', 25.0,
                FontWeight.bold,const Color.fromRGBO(0, 151, 236, 1.0)),
            divider(40.0),
            _inputText(false, 'Email', 'Email',const Icon(Icons.email), _user),
            divider(20.0),
            _inputText(
                true, 'Password', 'Password',const Icon(Icons.lock), _password),
            divider(40.0),
            _btnIniciar(),
            divider(20.0),
            _btnRegistrar(),
          ],
        ),
      ),
    );
  }

  Widget _inputText(bool obscureText, String hintText, String labelText,
      Icon icon, String input) {
    return TextField(
      obscureText: obscureText,
      decoration: inputDecoration(hintText, labelText, icon),
      onChanged: (valor) {
        setState(() {
          input = valor;
        });
      },
    );
  }

  Widget _buttonOlvidar() {
    return MaterialButton(
      child: childText('Olvidé mi Contraseña', 15.0, FontWeight.bold,
          const Color.fromRGBO(102, 102, 102, 1.0)),
      onPressed: () {
        _mostrarAlerta(context);
      },
    );
  }

  Widget _btnRegistrar() {
    return MaterialButton(
      child: childText('Crear una cuenta', 15.0, FontWeight.bold,
         const  Color.fromRGBO(102, 102, 102, 1.0)),
      onPressed: () {
        //Navigator.pushNamed(context, 'register_page');
      },
    );
  }

  Widget _btnIniciar() {
    return MaterialButton(
      shape: const StadiumBorder(),
      padding: const EdgeInsets.only(left: 50.0, right: 50.0),
      height: 50.0,
      color:const  Color.fromRGBO(0, 151, 236, 1.0),
      textColor: Colors.white,
      focusColor: Colors.blue,
      splashColor: Colors.blue,
      onPressed: () {
        Get.toNamed('/home');
      },
      child: childText(
          'INICIAR', 15.0, FontWeight.bold,const Color.fromRGBO(230, 230, 230, 1.0)),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title:const Text('Restablecer Contraseña'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _inputText(false, 'Email', 'Email',const Icon(Icons.email), _user),
              ],
            ),
            actions: [
              MaterialButton(
                onPressed: () => Get.toNamed('/register'),
                child:const Text('Cancelar'),
              ),
              MaterialButton(
                onPressed: () {
                  Get.toNamed('/register');
                },
                child:const Text('OK'),
              )
            ],
          );
        });
  }

  Widget childText(
      String texto, double fontSize, FontWeight fontWeight, Color color) {
    return Text(
      texto,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget divider(double size) {
    return SizedBox(
      height: size,
    );
  }

  InputDecoration inputDecoration(
      String hintText, String labelText, Icon icon) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      hintText: hintText,
      labelText: labelText,
      suffixIcon: icon,
    );
  }
}