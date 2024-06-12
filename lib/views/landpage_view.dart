
import 'package:biometrick/views/login_view.dart';
import 'package:biometrick/views/register.dart';
import 'package:flutter/material.dart';

class LandPageView extends StatelessWidget {
  static String id = 'landpage_view';

  const LandPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Don Gestin',
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Administra tu dinero de manera efectiva.',
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0),
                  FeatureCard(
                    icon: Icons.payment,
                    title: 'Recordatorios de Pagos',
                    description:
                        'Nunca pierdas un pago con nuestros recordatorios oportunos.',
                  ),
                  FeatureCard(
                    icon: Icons.savings,
                    title: 'Planes de Ahorro',
                    description: 'Configura objetivos de ahorro automáticos.',
                  ),
                  FeatureCard(
                    icon: Icons.history,
                    title: 'Registros de Transacciones',
                    description: 'Rastrea tus gastos con registros detallados.',
                  ),
                  FeatureCard(
                    icon: Icons.credit_card,
                    title: 'Tarjetas Personales',
                    description:
                        'Administra varias tarjetas y lleva un seguimiento de los saldos.',
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {                            
                            return const Color.fromARGB(255, 95, 95, 95);
                          }                          
                          return Colors.black;
                        }),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, LoginView.id);
                      },
                      child: const Text('Ya tengo una cuenta'),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {                            
                            return const Color.fromARGB(255, 95, 95, 95);
                          }                          
                          return Colors.black;
                        }),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterView.id);
                      },
                      child: const Text('Crear una nueva cuenta'),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(75, 175, 181, 193),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            Icon(icon, size: 28),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
