import 'package:biometrick/views/cards_view.dart';
import 'package:biometrick/views/home_view.dart';
import 'package:biometrick/views/landpage_view.dart';
import 'package:biometrick/views/login_view.dart';
import 'package:biometrick/views/main_view.dart';
import 'package:biometrick/views/register.dart';
import 'package:biometrick/views/reminders_view.dart';
import 'package:biometrick/views/saving_plans_view.dart';
import 'package:biometrick/views/wallet_view.dart';
import 'package:flutter/material.dart';




class CustomRoutes {
  static final routes = <String, WidgetBuilder>{
    LandPageView.id: (context) => const LandPageView(),
    LoginView.id: (context) => const LoginView(),
    RegisterView.id: (context) => const RegisterView(),
    HomeView.id: (context) => const HomeView(),
    WalletView.id: (context) => const WalletView(),
    RemindersView.id: (context) => const RemindersView(),
    MainView.id: (context) => const MainView(),
    SavingsPlansView.id: (context) => const SavingsPlansView(),
    CardsView.id: (context) => const CardsView(),
  };
}