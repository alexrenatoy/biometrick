
// import 'package:biometrick/services/auth_service.dart';
// import 'package:biometrick/utils/form_utils.dart';
// import 'package:biometrick/utils/validators.dart';
// import 'package:biometrick/views/admin/main_view.dart';
// import 'package:flutter/material.dart';

// class LoginAdmin extends StatefulWidget {
//   static String id = 'login_view';
//   const LoginAdmin({super.key});

//   @override
//   State<LoginAdmin> createState() => _LoginAdminState();
// }

// class _LoginAdminState extends State<LoginAdmin> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final AuthService _authService = AuthService();

//   // Función para realizar la autenticación
//   Future<void> _login() async {
    
//     if (_formKey.currentState?.validate() ?? false) {
//       final String username = _usernameController.text;
//       final String password = _passwordController.text;

//       // Llamar al servicio de autenticación para verificar las credenciales
//       final bool isAuthenticated = await _authService.login(username, password);

//       // Si las credenciales son válidas, navegar a la pantalla principal
//       if (isAuthenticated) {
//         Navigator.pushNamed(context, AdminView.id);
        
//       } else {
//         // Si las credenciales no son válidas, mostrar un mensaje de error al usuario
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               // title: Text('!Algo salió mal'),
//               actionsAlignment: MainAxisAlignment.center,
//               icon: Icon(
//                 Icons.error,
//                 size: 55,
//               ),
//               content: Text('Usuario y contraseña incorrectos.'),

//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text(
//                     'Volver a intentarlo.',
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Center(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Don Gestin',
//                   style: TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'Controla tu vida!!',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontStyle: FontStyle.italic,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 InputField(
//                   controller: _usernameController,
//                   labelText: 'Username',
//                   suffixIcon: Icons.person,
//                   validator: validateTXT,
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 InputField(
//                   controller: _passwordController,
//                   labelText: 'Password',
//                   suffixIcon: Icons.lock_outline,
//                   validator: validatePassword,
//                   isPassword: true,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                         (Set<MaterialState> states) {
//                       if (states.contains(MaterialState.pressed)) {
//                         return const Color.fromARGB(255, 95, 95, 95);
//                       }
//                       return Colors.black;
//                     }),
//                     foregroundColor:
//                         MaterialStateProperty.all<Color>(Colors.white),
//                   ),
//                   onPressed: _login,
//                   child: const Text('Iniciar Sesión'),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
