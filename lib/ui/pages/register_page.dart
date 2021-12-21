import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({Key? key}) : super(key: key);
  

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  String _user = '', _password = '', _name = '';
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
            childText('Gestión de Tutorias \n Registrarse', 25.0,
                FontWeight.bold,const Color.fromRGBO(0, 151, 236, 1.0)),
            divider(40.0),
            _inputText(false, 'Nombre', 'Nombre',const Icon(Icons.person), _name),
            divider(20.0),
            _inputText(false, 'Email', 'Email',const Icon(Icons.email), _user),
            divider(20.0),
            _inputText(
                true, 'Password', 'Password',const Icon(Icons.lock), _password),
            divider(40.0),
            _btnIniciar(),
            divider(20.0),
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
        Get.toNamed('/Nav');
      },
      child: childText(
          'REGISTRARSE', 15.0, FontWeight.bold,const Color.fromRGBO(230, 230, 230, 1.0)),
    );
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