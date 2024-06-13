import 'package:biometrick/views/assitance.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'firebase_options.dart';
import 'package:biometrick/router/routes.dart' as CustomRouter;

import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized(); // Asegura que Flutter esté inicializado
  await initializeDateFormatting('es_ES');
  tzdata.initializeTimeZones();
  var location = tz.getLocation('America/Guayaquil');
  tz.setLocalLocation(location);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Don Gestin C:',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: CustomRouter.Router.generateRoute,
      // Página inicial de la aplicación (puedes cambiarla según tu lógica)
      initialRoute: AssitanceView.id,
    );
  }
}
