import 'package:biometrick/views/admin/main_view.dart';
import 'package:biometrick/views/assistance.dart';
import 'package:biometrick/views/auth.dart';
import 'package:biometrick/views/auth/login_view.dart';
import 'package:biometrick/views/auth/register.dart';
import 'package:biometrick/views/home.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Home.id:
        return MaterialPageRoute(
          builder: (_) => Home(),
        );
      case RegisterView.id:
        return MaterialPageRoute(
          builder: (_) => RegisterView(),
        );
      case AssistanceView.id:
        return MaterialPageRoute(
          builder: (_) => AssistanceView(),
        );
      case AdminView.id:
        return MaterialPageRoute(
          builder: (_) => AdminView(),
        );
      case LoginView.id:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );
      case AuthBiometric.id:
        if (settings.arguments != null && settings.arguments is String) {
          String idUser = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => AuthBiometric(idUser: idUser),
          );
        }

        return _errorRoute();
      default:
        // Manejo de ruta no encontrada
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(child: Text('Ruta no encontrada')),
      ),
    );
  }
}




// class CustomRoutes {
//   static final routes = <String, WidgetBuilder>{
//     Home.id: (context) => const Home(),
//     AuthBiometric.id: (context) => const AuthBiometric(idUser),
//     AssitanceView.id: (context) => AssitanceView(),
//     AssitanceView.id: (context) => const Authentificated(),

//     Add.id: (context) => const Add(),
//     LandPageView.id: (context) => const LandPageView(),
//     LoginView.id: (context) => const LoginView(),
//     RegisterView.id: (context) => const RegisterView(),
//     HomeView.id: (context) => const HomeView(),
//     WalletView.id: (context) => const WalletView(),
//     RemindersView.id: (context) => const RemindersView(),
//     MainView.id: (context) => const MainView(),
//     SavingsPlansView.id: (context) => const SavingsPlansView(),
//     CardsView.id: (context) => const CardsView(),
//   };
// }