import 'package:flutter/material.dart';
import 'package:flutter_application_mary/domain/authentication.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);
  

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

final _formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  AuthenticationController authenticationController = Get.find();

  _login(theEmail, thePassword) async {
    print('_login $theEmail $thePassword');
    try {
      _login(controllerEmail, controllerPassword);
      
    } catch (err) {
      Get.snackbar(
        "Login",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Login with email",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                key: const ValueKey("loginEmail"),
                keyboardType: TextInputType.emailAddress,
                controller: controllerEmail,
                decoration: const InputDecoration(labelText: "Email address"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter email";
                  } else if (!value.contains('@')) {
                    return "Enter valid email address";
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                key: const ValueKey("loginPassword"),
                controller: controllerPassword,
                decoration: const InputDecoration(labelText: "Password"),
                keyboardType: TextInputType.number,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter password";
                  } else if (value.length < 6) {
                    return "Password should have at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              _btnIniciar(),
               
            ]),
          ),
          TextButton(
              onPressed: () {
              
                
              },
              child: const Text("Create cuenta"))
        ],
      ),
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
      onPressed: () async {
                  // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                  FocusScope.of(context).requestFocus(FocusNode());
                  final form = _formKey.currentState;
                  form!.save();
                  if (_formKey.currentState!.validate()) {
                    await _login(controllerEmail.text, controllerPassword.text);
                  }
      },
      child: const Text('INICIAR'),
    );
  }
}