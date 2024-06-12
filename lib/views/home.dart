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
          builder: ((context, snapshot) {
            // return const Text('Hola Chicos');
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(snapshot.data?[index]["name"]),
                      // Text(snapshot.data?[index]["age"]),
                      Text(snapshot.data?[index]["email"]),

                    ],
                  );
                });
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Add.id);
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
