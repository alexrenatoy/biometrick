import 'package:biometrick/utils/form_utils.dart';
import 'package:biometrick/utils/validators.dart';
import 'package:biometrick/views/admin/main_view.dart';
import 'package:biometrick/views/auth.dart';
import 'package:biometrick/views/auth/login_view.dart';
import 'package:flutter/material.dart';

class AssistanceView extends StatefulWidget {
  static const String id = 'register';
  const AssistanceView({super.key});

  @override
  State<AssistanceView> createState() => _AssistanceView();
}

class _AssistanceView extends State<AssistanceView> {
  final TextEditingController _cedulaController = TextEditingController();  
  bool _isAdminButtonVisible = false;
  int _tapCount = 0;

  Widget buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required String? Function(String?) validator,
    bool obscureText = false,
    required IconData suffixIcon,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          suffixIcon: Icon(suffixIcon),
          filled: true,
          fillColor: Colors.white,
        ),
        validator: validator,
      ),
    );
  }

    void _handleAdminTap() {
    setState(() {
      _tapCount++;
      if (_tapCount >= 5) {
        _isAdminButtonVisible = true;
        _tapCount = 0;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _handleAdminTap,
              child: Text(
              'Identificate',
              style: TextStyle(fontSize: 24),
            ),
            ),
            const SizedBox(height: 20.0),
            InputField(
              controller: _cedulaController,
              labelText: 'Número de identificación',
              suffixIcon: Icons.perm_identity,
              validator: validateNumericField,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AuthBiometric(idUser: _cedulaController.text)),
                );
                _cedulaController.clear();
              },
              child: const Text('Registrar'),
            ),
            if (_isAdminButtonVisible)
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
                Navigator.pushNamed(context, LoginView.id);
              },
                child: const Text('Admin'),
              ),
          ],
        ),
      ),
    );
  }
}
