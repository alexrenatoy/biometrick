import 'package:biometrick/utils/form_utils.dart';
import 'package:biometrick/utils/validators.dart';
import 'package:biometrick/views/assistance.dart';
import 'package:biometrick/services/firebase_service.dart';
import 'package:biometrick/views/home.dart';

import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  static const String id = 'register_view';
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _iduserController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _register() async {
    if (_formKey.currentState?.validate() ?? false) {
      // Guardar los datos
      final idUser = _iduserController.text;
      final name = _usernameController.text;
      final email = _emailController.text;
      final password = _passwordController.text;

      try {
        bool res = await addNewUser(idUser, name, email, password);
        if (res) {
          Navigator.pushNamed(context, AssistanceView.id);
        } else {
          Navigator.pushNamed(context, Home.id);
        }
        _iduserController.clear();
        _usernameController.clear();
        _emailController.clear();
        _passwordController.clear();
      } catch (e) {
        print(e);
        //ventana de error
      }
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Biometrick',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Registrate para empezar',
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InputField(
                      controller: _iduserController,
                      labelText: 'Número de identificación',
                      suffixIcon: Icons.perm_identity,
                      validator: validateNumericField,
                    ),
                    const SizedBox(height: 16),
                    InputField(
                      controller: _usernameController,
                      labelText: 'Nickname',
                      suffixIcon: Icons.person,
                      validator: validateTXT,
                    ),
                    const SizedBox(height: 16),
                    InputField(
                      controller: _emailController,
                      labelText: 'Correo',
                      suffixIcon: Icons.email,
                      validator: validateEmail,
                    ),
                    const SizedBox(height: 16),
                    InputField(
                      controller: _passwordController,
                      labelText: 'Contraseña',
                      suffixIcon: Icons.lock,
                      validator: validatePassword,
                      isPassword: true,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _register,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed)) {
                            return Color.fromARGB(255, 95, 95, 95);
                          }
                          // Color de fondo normal
                          return const Color.fromARGB(255, 0, 0, 0);
                        }),
                        foregroundColor:
                            WidgetStateProperty.all<Color>(Colors.white),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Registrar',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed)) {
                            return const Color.fromARGB(255, 95, 95, 95);
                          }
                          return Colors.black;
                        }),
                        foregroundColor:
                            WidgetStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Home.id);
                      },
                      child: const Text('Cancelar'),
                    ),
                  ],
                ),
              ),
            ])),
      ),
    );
  }
}
