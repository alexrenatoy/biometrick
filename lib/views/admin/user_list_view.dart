import 'package:biometrick/services/firebase_service.dart';
import 'package:flutter/material.dart';

class UsersListView extends StatefulWidget {
  const UsersListView({super.key});

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  Future<List<Map<String, dynamic>>>? _futureUsers;
  final TextEditingController _idUserController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _oldIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _futureUsers = getUsers();
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuarios'),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No se encontraron usuarios'));
          } else {
            List<Map<String, dynamic>> users = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Identificación')),
                  DataColumn(label: Text('Nombres')),
                  DataColumn(label: Text('Acciones')),
                ],
                rows: users
                    .map(
                      (user) => DataRow(
                        cells: [
                          DataCell(Text(user['id_user'] ?? '')),
                          DataCell(Text(user['name'] ?? '')),
                          DataCell(Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  _showEditDialog(user);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () async {
                                  String userIdToDelete = user['id_user'];
                                  try {
                                    await deleteUser(userIdToDelete);
                                    setState(() {
                                      _futureUsers = getUsers();
                                    });
                                  } catch (e) {
                                    print('Error al eliminar usuario: $e');
                                  }
                                },
                              ),
                            ],
                          )),
                        ],
                      ),
                    )
                    .toList(),
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> _showEditDialog(Map<String, dynamic> user) async {
    _idUserController.text = user['id_user'] ?? '';
    _nameController.text = user['name'] ?? '';
    _oldIdController.text = user['id_user'] ?? '';

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Usuario'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _idUserController,
                  decoration: InputDecoration(labelText: 'Identificación'),
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nombres'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Guardar'),
              onPressed: () async {
                String newUserId = _idUserController.text.trim();
                String newName = _nameController.text.trim();
                String oldId = _oldIdController.text.trim();
                
                print('error $oldId');
                try {
                  await updateUserId(oldId, newUserId, newName);              
                  setState(() {
                    _futureUsers = getUsers();
                  });
                  Navigator.of(context).pop();
                } catch (e) {
                  print('Error al actualizar usuario: $e');
                  // Aquí puedes mostrar un mensaje de error al usuario si es necesario
                }
              },
            ),
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}