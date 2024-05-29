import 'package:flutter/material.dart';
import 'package:project/View/Screem/CEquipoScreem.dart';
import 'package:project/View/Screem/MyHomePage.dart';
import 'package:project/View/Screem/PagoScreem.dart';
import 'package:project/View/Screem/UnirseJuegoScreem.dart';

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
        appBar: AppBar(
          title: const Text(
            "Reservar instalación",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.black,
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.home, color: Colors.black),
                    SizedBox(width: 10),
                    Text('Home ', style: TextStyle(color: Colors.black)),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(MyHomePage.nombre);
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.sports_soccer, color: Colors.black),
                    SizedBox(width: 10),
                    Text('Crear equipo ',
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(CEquipoScreem.nombre);
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.group, color: Colors.black),
                    SizedBox(width: 10),
                    Text('Unirse a Juego ',
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(UnirseJuegoScreem.nombre);
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.black),
                    SizedBox(width: 10),
                    Text('Reservar instalaciones ',
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(ReservarScreem.nombre);
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.payment, color: Colors.black),
                    SizedBox(width: 10),
                    Text('Realizar pago ',
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(PagoScreem.nombre);
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Selecciona la fecha:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Seleccionar fecha'),
                ),
                SizedBox(height: 20),
                Text(
                  'Fecha seleccionada: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Selecciona la hora:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text('Seleccionar hora'),
                ),
                SizedBox(height: 20),
                Text(
                  'Hora seleccionada: ${_selectedTime.format(context)}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Aquí puedes implementar la lógica para completar la reserva
                  },
                  child: Text('Reservar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
