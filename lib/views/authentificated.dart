// import 'package:cloud_firestore/cloud_firestore.dart'; // Importamos Firebase Firestore

// class Authentificated {
//   static const String id = 'authentificated';

//   // Función para subir los datos a Firebase
//   static Future<void> authentificatedUser(String cedula) async {
//     final FirebaseFirestore db = FirebaseFirestore.instance;
    
//     try {
//       String formattedDate = DateTime.now().toString(); // Obtener fecha y hora actual
//       await db.collection('Asistencia').add({
//         'Cedula': cedula,
//         'FechaHora': formattedDate,
//       });
//       print('Datos subidos a Firebase exitosamente');
//     } catch (e) {
//       print('Error al subir datos a Firebase: $e');
//     }
//   }
// }
