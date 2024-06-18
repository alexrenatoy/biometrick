import 'package:biometrick/views/admin/attendance_view.dart';
import 'package:biometrick/views/admin/user_list_view.dart';
import 'package:biometrick/views/home.dart';
import 'package:flutter/material.dart';

class AdminView extends StatefulWidget {
  static const String id = 'admin_view';
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  int _currentIndex = 0;
  final List<Widget> _children = [Attendancetable(), UsersListView(), Home()];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),        
      ),
      body: _children[_currentIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Alex Yugcha'),
              accountEmail: Text('art.yugcha@yavirac.edu.ec'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.jpg'),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Registro de asistencia'),
              onTap: () {
                onTabTapped(0);
              },
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              leading: Icon(Icons.supervised_user_circle_sharp),
              title: Text('Lista de usuarios'),
              onTap: () {
                onTabTapped(1);                
              },
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Volver a menú principal'),
              onTap: () {
                onTabTapped(2);                
              },
            ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    Navigator.pop(context); // Cierra el drawer
    setState(() {
      _currentIndex = index;
    });
  }
}
