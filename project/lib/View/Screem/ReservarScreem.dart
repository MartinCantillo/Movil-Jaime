import 'package:flutter/material.dart';
import 'package:project/Data/InstalacionDeportivaData.dart';
import 'package:project/Data/ReservaData.dart';
import 'package:project/Model/InstalacionDeportiva.dart';
import 'package:project/Model/Reserva.dart';
import 'package:project/View/Widget/AppBarW.dart';
import 'package:project/View/Widget/drawer.dart';

class ReservarScreem extends StatefulWidget {
  const ReservarScreem({Key? key}) : super(key: key);
  static const String nombre = 'ReservarScreem';

  @override
  State<ReservarScreem> createState() => _ReservarScreemState();
}

class _ReservarScreemState extends State<ReservarScreem> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarW(title: 'Reservar instalación',),
        body: _buildFacilityList(),
        drawer: DrawerW(user: "Martin",correo: "Martin@gmail.com",),
      ),
    );
  }
Widget _buildFacilityList() {
  final List<InstalacionDeportiva> availableFacilities =
      instalacionesDeportivas
          .where((instalacion) => instalacion.disponibilidad == true)
          .toList();

  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
    ),
    itemCount: availableFacilities.length,
    itemBuilder: (context, index) {
      final instalacion = availableFacilities[index];
      return InkWell(
        onTap: () {
          _showReservationDialog(context, instalacion);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(54),
          ),
          elevation: 80,
          shadowColor: Colors.blue, 
          child: ListTile(
            leading: Icon(Icons.sports), 
            title: Text(
              'Instalacion : ${instalacion.nombreInstalacion ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Tipo : ${instalacion.tipo ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    },
  );
}



  void _showReservationDialog(
      BuildContext context, InstalacionDeportiva instalacion) {
    String codigo = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar reserva'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Instalación: ${instalacion.nombreInstalacion}'),
              SizedBox(height: 8),
              Text('Tipo: ${instalacion.tipo}'),
              SizedBox(height: 8),
              Text(
                  'Fecha: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
              SizedBox(height: 8),
              Text('Hora: ${_selectedTime.format(context)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                _reserveFacility(instalacion);
                Navigator.pop(context);
              },
              child: Text('Reservar'),
            ),
          ],
        );
      },
    );
  }

  void _reserveFacility(InstalacionDeportiva instalacion) {
    final reserva = Reserva(
      id: reservas.length + 1,
      usuarioId: 1, 
      instalacionId: instalacion.id!,
      fecha: _selectedDate,
      horaInicio: DateTime(_selectedDate.year, _selectedDate.month,
          _selectedDate.day, _selectedTime.hour, _selectedTime.minute),
      horaFin: DateTime(_selectedDate.year, _selectedDate.month,
          _selectedDate.day, _selectedTime.hour, _selectedTime.minute)
          .add(Duration(hours: 1)),
      estadoPago: false,
    );

    setState(() {
      reservas.add(reserva);
      instalacion.disponibilidad = false;
    });

  
    print('Reserva realizada: $reserva');
  }
}
