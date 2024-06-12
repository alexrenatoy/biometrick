
import 'package:flutter/material.dart';

class WalletView extends StatefulWidget {
  static String id = 'wallet_view';
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Wallet Page'),
      
    );
  }
}