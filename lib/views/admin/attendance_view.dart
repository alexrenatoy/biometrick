import 'package:biometrick/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Attendancetable extends StatefulWidget {
  const Attendancetable({super.key});

  @override
  State<Attendancetable> createState() => _AttendancetableState();
}

class _AttendancetableState extends State<Attendancetable> {
  
  Future<List<Map<String, dynamic>>>? _futureRecords;

  @override
  void initState() {
    super.initState();
    _futureRecords = attendanceRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de asistencia'),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureRecords,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No se encontraron registros'));
          } else {
            List<Map<String, dynamic>> records = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 15,
                columns: const [
                  DataColumn(label: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'N° de\n'),
                        TextSpan(text: 'Identificación'),
                      ],
                    ),                    
                  )),
                  DataColumn(label: Text('Fecha', 
                  textAlign: TextAlign.center,)),
                  DataColumn(label: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Hora de\n'),
                        TextSpan(text: 'Entrada'),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )),
                  DataColumn(label: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Hora de\n'),
                        TextSpan(text: 'Salida'),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )),
                ],
                rows: records.map((record) {
                  return DataRow(cells: [
                    DataCell(Text(record['id_user'] ?? '')),
                    DataCell(Text(record['date'] ?? '')),
                    DataCell(Text(record['entry_time'] ?? '')),
                    DataCell(Text(record['departure_time'] ?? '')),
                  ]);
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
