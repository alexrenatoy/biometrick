import 'package:flutter/material.dart';

class RemindersView extends StatefulWidget {
  static String id = 'reminders_view';
  const RemindersView({super.key});

  @override
  State<RemindersView> createState() => _RemindersViewState();
}

class _RemindersViewState extends State<RemindersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recordatorios'),
        leading: Icon(Icons.calendar_month),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tarjetas disponibles y detalles',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    // child: Image.asset('assets/mastercard.png'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Tu sitio para revisar todos tus pendientes económicos'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Agregar recordatorio'),
            ),
            SizedBox(height: 40),
            Text(
              'Pagos Consumo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            DataTable(
              columns: [
                DataColumn(label: Text('Tarjeta')),
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Fecha')),
                DataColumn(label: Text('Descripción')),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text('Banc. Pichinca')),
                    DataCell(Text('Pagar Luz')),
                    DataCell(Text('13-10-2023')),
                    DataCell(Text('Pagar antes del 15 de junio')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Banc. Pichinca')),
                    DataCell(Text('Pagar Luz')),
                    DataCell(Text('13-10-2023')),
                    DataCell(Text('Pagar antes del 15 de junio')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Banc. Pichinca')),
                    DataCell(Text('Pagar Luz')),
                    DataCell(Text('13-10-2023')),
                    DataCell(Text('Pagar antes del 15 de junio')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
