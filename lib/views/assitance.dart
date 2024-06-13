import 'package:biometrick/views/auth.dart';
import 'package:flutter/material.dart';


class AssitanceView extends StatefulWidget {
   static const String id = 'register';
   const AssitanceView({super.key});


  @override
  State<AssitanceView> createState() => _AssitanceView();
}

class _AssitanceView extends State<AssitanceView> {
  final TextEditingController _cedulaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cedulaController,
              decoration: InputDecoration(
                labelText: 'Número de Cédula',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthBiometric(idUser: _cedulaController.text)),
                );
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}