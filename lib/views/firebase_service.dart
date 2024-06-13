import 'package:cloud_firestore/cloud_firestore.dart';
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

//ADD
// Future<void> createUsers(String name) async {
//   try {
//     await db.collection('Users').add(({'Nombre': name }));
//     print('Usuario creado exitosamente');
//   } catch (e){
//     print('Error al crear usuario: $e');
//   }

// }

// Register

Future<bool> addAssistence(String idUser) async {
    DateTime now = tz.TZDateTime.now(tz.local);
    String formattedDate = DateFormat('dd/MM/yyyy HH:mm:ss', 'es').format(now);  
  try {
    final data = {"iduser": idUser, "date": formattedDate};
    print("esto es la data: ${data} ");
    await db.collection("users").add(data);
    return true;
  } catch (e) {
    throw Exception('Error al subir datos de usuario');
  }
}
