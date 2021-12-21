import 'package:flutter/material.dart';
import 'package:flutter_application_mary/ui/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _user = '', _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 230, 1.0),
      body: Container(
        //decoration: BoxDecoration(border: Border.all(color: Colors.green)),
        padding: EdgeInsets.only(left: 30.0, right: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            childText('Gestión de Tutorias \n Inicio de Sesion', 25.0,
                FontWeight.bold, Color.fromRGBO(0, 151, 236, 1.0)),
            divider(40.0),
            _inputText(false, 'Email', 'Email', Icon(Icons.email), _user),
            divider(20.0),
            _inputText(
                true, 'Password', 'Password', Icon(Icons.lock), _password),
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
    return FlatButton(
      child: childText('Olvidé mi Contraseña', 15.0, FontWeight.bold,
          Color.fromRGBO(102, 102, 102, 1.0)),
      onPressed: () {
        _mostrarAlerta(context);
      },
    );
  }

  Widget _btnRegistrar() {
    return FlatButton(
      child: childText('Crear una cuenta', 15.0, FontWeight.bold,
          Color.fromRGBO(102, 102, 102, 1.0)),
      onPressed: () {
        //Navigator.pushNamed(context, 'register_page');
      },
    );
  }

  Widget _btnIniciar() {
    return FlatButton(
      shape: StadiumBorder(),
      padding: EdgeInsets.only(left: 50.0, right: 50.0),
      height: 50.0,
      color: Color.fromRGBO(0, 151, 236, 1.0),
      textColor: Colors.white,
      focusColor: Colors.blue,
      splashColor: Colors.blue,
      onPressed: () {
        print('ingreso');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home_page()),
        );
      },
      child: childText(
          'INICIAR', 15.0, FontWeight.bold, Color.fromRGBO(230, 230, 230, 1.0)),
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
            title: Text('Restablecer Contraseña'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _inputText(false, 'Email', 'Email', Icon(Icons.email), _user),
              ],
            ),
            actions: [
              FlatButton(
                onPressed: () => Navigator.pushNamed(context, 'register_page'),
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'register_page');
                },
                child: Text('OK'),
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
