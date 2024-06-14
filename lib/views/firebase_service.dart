import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUsers() async {
  List users = [];
  CollectionReference collectionReferenceUsers = db.collection("users");
  QuerySnapshot queryUsers = await collectionReferenceUsers.get();
  queryUsers.docs.forEach((documento) {
    users.add(documento.data());
  });
  return users;
}

//ADD new user
Future<bool> addNewUser(String idUser, String name, String email,String password,) async {
  try {
    await db.collection("users").add({
        'id_user': idUser,
        'name': name,
        'email': email,
        'password': password,
      });
    return true;
  } catch (e){
    print('Error al crear usuario: $e');
    return false;
  }

}

// Register

Future<bool> addAssistence(BuildContext context, String idUser) async {
  DateTime now = tz.TZDateTime.now(tz.local);
  // String formattedDate = DateFormat('dd/MM/yyyy HH:mm:ss', 'es_ES').format(now);
  String formattedDay = DateFormat('dd/MM/yyyy', 'es_ES').format(now);
  String formattedTime = DateFormat('HH:mm:ss', 'es_ES').format(now);
  try {
    final userQuery = await db
        .collection("users")
        .where("id_user", isEqualTo: idUser)
        .get();
    final userSnapshot = userQuery.docs;

    if (userSnapshot.isEmpty) {
    print('No se encontro usuario: $idUser');
      return false;
    }

    // Verificar si hay un registrodel dia actual
    final attendanceQuery = await db
        .collection("attendance")
        .where("id_user", isEqualTo: idUser)
        .where("date", isEqualTo: formattedDay)
        .get();
    if (attendanceQuery.docs.isNotEmpty) {
      // Si existe un registro para hoy, actualizar el campo 'departure_time'
      final docId = attendanceQuery.docs.first.id;
      await db
          .collection("attendance")
          .doc(docId)
          .update({'departure_time': formattedTime});
    } else {
      // Si no existe un registro para hoy, crear uno nuevo
      await db.collection("attendance").add({
        'id_user': idUser,
        'entry_time': formattedTime,
        'departure_time': null,
        'date': formattedDay,
      });
    }
    print(
        "Registro de asistencia actualizado: idUser=$idUser, date=$formattedDay, time=$formattedTime");
    
    return true;
  } catch (e) {
    print('Error al subir datos de usuario: $e');
   
    return false;
  }
}
