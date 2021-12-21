import 'package:flutter/material.dart';

class CreateGroups extends StatefulWidget {

  const CreateGroups({Key? key}) : super(key: key);

  @override
  _creategroupsstate createState() => _creategroupsstate();
}

class _creategroupsstate extends State<CreateGroups> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 200.0,
              ),
              _nameTextField(),
              const SizedBox(
                height: 15.0,
              ),
              _user1TextField(),
              const SizedBox(
                height: 15.0,
              ),
              _user2TextField(),
              const SizedBox(
                height: 20.0,
              ),
              _buttonCreate(),
            ],
          ),
        ),
      ),
    );
  }

   _nameTextField() {
     return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(  
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple),
            ),
            icon: Icon(Icons.group_work),
            labelText: 'Nombre -Id del grupo',  
            hintText: 'grupo #',  
            fillColor: Colors.white30,
             ),
        onChanged: (text) {

        },
      ),
    );
  }

   

  _user1TextField() {
     return Container(
      padding:const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(  
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple),
            ),
            icon: Icon(Icons.person),
            labelText: 'Nombre Estudiante 1',  
            hintText: 'pepito perez',  
            fillColor: Colors.white30,
             ),
        onChanged: (text) {

        },
      ),
    );
  }


 _user2TextField() {
     return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(  
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple),
            ),
            icon: Icon(Icons.person),
            labelText: 'Nombre Estudiante 2',  
            hintText: 'pepito perez',  
            fillColor: Colors.white30,
             ),
        onChanged: (text) {

        },
      ),
    );
  }

  _buttonCreate() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: MaterialButton(
          color: Colors.blue,
          minWidth: 250.0,
          height: 50.0,
          child: const Text('Crear grupo',
              style:TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold)),
          onPressed: () {
           
          },
        ));
  }

  
}