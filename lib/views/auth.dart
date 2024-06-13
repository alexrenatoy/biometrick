import 'package:biometrick/services/auth_service.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';
import 'package:biometrick/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthBiometric extends StatefulWidget {
  static String id = 'auth';
  const AuthBiometric({super.key});

  @override
  State<AuthBiometric> createState() => _AuthBiometricState();
}

class _AuthBiometricState extends State<AuthBiometric> {
  final LocalAuthentication _auth = LocalAuthentication();
  bool _checkBio = false;
  bool _isBioFinger = false;
  bool _isAuthenticated = false;

  @override
  void initState() {   
    super.initState();
    _checkBiometric();
    _listBioFingerType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Sistema de asistencia - Biometrick'),),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: _startAuth, 
              icon: Icon(Icons.fingerprint),
              iconSize: 80,
              ),
              const SizedBox(height: 15,),
              const Text('Ingrese su huella dáctilar',
              style: TextStyle(fontSize: 20.0),)
          ],
        ),
        ),
    );
  }

  void _checkBiometric() async {
    try {
      final bio = await _auth.canCheckBiometrics;
      setState(() {
        _checkBio = bio;
      });
      print('Biometrics - $_checkBio');
    }catch (e) {}
  }
  void _listBioFingerType() async {
    late List<BiometricType> _listType;
    try {
      _listType = await _auth.getAvailableBiometrics();
    }on PlatformException catch (e) {
      print(e.message);
    }
  }

  void _startAuth() async {
    try {
      _isAuthenticated = await _auth.authenticate(
        localizedReason: 'Escanea tu huella',
        authMessages: const <AuthMessages>[
        AndroidAuthMessages(
          signInTitle: 'Huella Biometrica requerida',
          cancelButton: 'No, gracias'
        )
        ],                    
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true,          
        ));
    } on PlatformException catch (e) {
      print(e.message);
    }
    if (_isAuthenticated){
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => Home()));
    }
  }
}