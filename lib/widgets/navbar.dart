// import 'package:don_gestin_movil/views/home_view.dart';
// import 'package:don_gestin_movil/views/landpage_view.dart';
// import 'package:don_gestin_movil/views/wallet_view.dart';
// import 'package:flutter/material.dart';

// class CustomNavbar extends StatefulWidget {
//   const CustomNavbar({super.key});

//   @override
//   State<CustomNavbar> createState() => _CustomNavbarState();
// }

// class _CustomNavbarState extends State<CustomNavbar> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;      
//     });

//     switch (index) {
//       case 0:
//         Navigator.pushReplacementNamed(context, HomeView.id);
//         break;
//       case 1:
//         Navigator.pushReplacementNamed(context, WalletView.id);
//         break;
//       case 2:
//         Navigator.pushReplacementNamed(context, LandPageView.id);
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//   return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       items: [
//        BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined), 
//             activeIcon: Icon(Icons.home),
//             label: 'Home',
//             backgroundColor: Colors.grey
//             ),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.wallet_outlined), 
//             activeIcon: Icon(Icons.wallet),
//             label: 'Wallet',
//             backgroundColor: Colors.grey
//             ),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.exit_to_app_outlined), 
//             activeIcon: Icon(Icons.exit_to_app),
//             label: 'Landa',
//             backgroundColor: Colors.amber,
//             ),
//       ],
//       currentIndex: _selectedIndex,
//       selectedItemColor: Colors.green,
//       // unselectedItemColor: Colors.grey, 
//       showUnselectedLabels: true, 
//       onTap: _onItemTapped,
//     );
//   }
// }

