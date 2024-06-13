import 'package:biometrick/views/firebase_service.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  static String id = 'add';
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar nuevo registro"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Ingrese el nuevo nombre"),
          ),
          ElevatedButton(onPressed: () async {
            // await createUsers(nameController.text);
          }, child: const Text('Agregar'), )
        ],
      ),
    );
  }
}
