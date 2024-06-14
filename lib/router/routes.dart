import 'package:biometrick/views/assistance.dart';
import 'package:biometrick/views/auth.dart';
import 'package:biometrick/views/home.dart';
import 'package:flutter/material.dart';


class Router {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Home.id:
        return MaterialPageRoute(
          builder: (_) => Home(),
        );
      case AssistanceView.id:
        return MaterialPageRoute(
          builder: (_) => AssistanceView(),
        );
      case AuthBiometric.id:
        // Si la ruta requiere un valor (cedula en este caso), puedes pasarla a través de arguments
        if (settings.arguments != null && settings.arguments is String) {
          String idUser = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => AuthBiometric(idUser: idUser),
          );
        }
        // Manejo de error o redireccionar a una página por defecto si no se proporciona la cédula
        return _errorRoute(); // Ejemplo de función _errorRoute() que muestra una página de error
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