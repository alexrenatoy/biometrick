import 'dart:async';

import 'package:biometrick/views/add.dart';
import 'package:biometrick/views/assistance.dart';
import 'package:biometrick/services/firebase_service.dart';
import 'package:biometrick/views/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class Home extends StatefulWidget {
  static const String id = 'home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    // Iniciar el temporizador para actualizar la hora cada segundo
    _updateTime();
    // Llamar _updateTime cada segundo para mantener actualizada la hora
    Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    setState(() {
      _currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Registro de Asistencia',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hora Actual:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              _currentTime,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                  if (states.contains(WidgetState.pressed)) {
                    return const Color.fromARGB(255, 95, 95, 95);
                  }
                  return Colors.black;
                }),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AssistanceView.id);                
              },
              child: const Text('Registrarme'),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                  if (states.contains(WidgetState.pressed)) {
                    return const Color.fromARGB(255, 95, 95, 95);
                  }
                  return Colors.black;
                }),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, RegisterView.id);
              },
              child: const Text('Crear nueva cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}
