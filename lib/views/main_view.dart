import 'package:biometrick/views/cards_view.dart';
import 'package:biometrick/views/home_view.dart';
import 'package:biometrick/views/saving_plans_view.dart';
import 'package:flutter/material.dart';
import 'wallet_view.dart';
import 'reminders_view.dart';

class MainView extends StatefulWidget {
  static String id = 'main_view';
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 2;
  final List<Widget> _children = [SavingsPlansView(), WalletView(), HomeView(),  CardsView(),RemindersView(), ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.savings_outlined),
            activeIcon: Icon(Icons.savings),
            label: 'Savings',
            backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            activeIcon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
            backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black87
          ),        
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_sharp),
            activeIcon: Icon(Icons.credit_card_rounded),
            label: 'Cards',
            backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            activeIcon: Icon(Icons.calendar_month),
            label: 'Reminder',
            backgroundColor: Colors.black
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}