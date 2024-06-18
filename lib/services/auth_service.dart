// auth_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
FirebaseFirestore db = FirebaseFirestore.instance;
class AuthService {
  // Función para realizar la autenticación
  Future<bool> login(String username, String password) async {
    // try {      
    //   QuerySnapshot querySnapshot = await db
    //       .collection('users')
    //       .where('username', isEqualTo: username)
    //       .where('password', isEqualTo: password)
    //       .get();

      
    //   if (querySnapshot.docs.isNotEmpty) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // } catch (e) {
    //   print('Error al autenticar usuario: $e');
    //   return false;
    // }
    if (username == 'admin' && password == 'admin123') {
      return true;
    } else {
      return false;
    }
  }
}
