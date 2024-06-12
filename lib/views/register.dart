
import 'package:biometrick/utils/form_utils.dart';
import 'package:biometrick/utils/validators.dart';
import 'package:biometrick/views/login_view.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  static String id = 'register_view';
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _register() {
    if (_formKey.currentState?.validate() ?? false) {
      // Guardar los datos
      final username = _usernameController.text;
      final email = _emailController.text;
      final password = _passwordController.text;

      Navigator.pushNamed(context, LoginView.id, arguments: {
        'username': username,
        'email': email,
        'password': password,
      });
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
                'Don Gestin',
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
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Color.fromARGB(255, 95, 95, 95);
                          }
                          // Color de fondo normal
                          return const Color.fromARGB(255, 0, 0, 0);
                        }),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Registrar',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {                            
                            return const Color.fromARGB(255, 95, 95, 95);
                          }                          
                          return Colors.black;
                        }),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, LoginView.id);
                      },
                      child: const Text('Volver'),
                    ),
                  ],
                ),
              ),
            ])),
      ),
    );
  }
}
