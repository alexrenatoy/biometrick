import 'package:biometrick/views/add.dart';
import 'package:biometrick/views/firebase_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static String id = 'home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Material para un Crud',
          style: TextStyle(fontSize: 30.0, fontFamily: 'cursive'),
        ),
        backgroundColor: Color.fromARGB(136, 26, 72, 223),
      ),
      body: FutureBuilder(
        future: getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Mientras el futuro se está resolviendo, puedes mostrar un indicador de carga
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Si ocurre un error, puedes mostrar un mensaje de error
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            // Si no hay datos, muestra un mensaje adecuado
            return Center(child: Text('No data available'));
          } else {
            // Si hay datos, construye la lista
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final user = snapshot.data?[index];
                return Column(
                  children: [
                    Text(user["name"] ?? 'No name'),
                    Text(user["email"] ?? 'No email'),
                  ],
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Add.id);
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
