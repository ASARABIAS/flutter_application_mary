import 'package:flutter/material.dart';

class CreateSesion extends StatefulWidget {

  const CreateSesion({Key? key}) : super(key: key);
  

  @override
  _createsesionstate createState() => _createsesionstate();
}

class _createsesionstate extends State<CreateSesion> {

  List<String> _locations = ['grupo 1', 'grupo 2', 'grupo 3', 'grupo 4'];
  //String groupId='';
  bool Value1 = false;
  bool Value2 = false;

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
              _groupTextField(),
              const SizedBox(
                height: 15.0,
              ),
              _user1(),
              const SizedBox(
                height: 15.0,
              ),
              _user2(),
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

   _groupTextField() {
      
        var groupId2 ;
        return DropdownButton<String>(
            key: const ValueKey("sesionDrop"),
            value: groupId2,
            items: _locations.map((String val) {
              return DropdownMenuItem<String>(
                key: ValueKey(val),
                value: val,
                child: Text(val),
              );
            }).toList(),
            hint: const Text("Escoger un grupo"),
            onChanged: (value) {
              setState(() {
               // groupId = value!;
              });
            },
          );
  }

   

  _user1() {
    
     return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Student 1'),
              Switch(
                key: const ValueKey("sesionUser1"),
                value: Value1,
                onChanged: (value) {
                  setState(() {
                    Value1 = value;
                  });
                },
              )
            ],
          );
  }


 _user2() {
      return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Student 2'),
              Switch(
                key: const ValueKey("sesionUser2"),
                value: Value2 ,
                onChanged: (value) {
                  setState(() {
                    Value2 = value;
                  });
                },
              )
            ],
          );
  }

  _buttonCreate() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: MaterialButton(
          color: Colors.blue,
          minWidth: 250.0,
          height: 50.0,
          child: const Text('Add sesion y asistencia',
              style:TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold)),
          onPressed: () {
           
          },
        ));
  }


  
}