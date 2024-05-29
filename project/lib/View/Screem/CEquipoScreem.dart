import 'package:flutter/material.dart';
import 'package:project/View/Screem/MyHomePage.dart';
import 'package:project/View/Screem/PagoScreem.dart';
import 'package:project/View/Screem/ReservarScreem.dart';
import 'package:project/View/Screem/UnirseJuegoScreem.dart';

class CEquipoScreem extends StatefulWidget {
  const CEquipoScreem({Key? key});
  static const String nombre = 'CEquipoScreem';
  @override
  State<CEquipoScreem> createState() => _CEquipoScreemState();
}

class _CEquipoScreemState extends State<CEquipoScreem> {
  final _formKey = GlobalKey<FormState>();
  late String _deporte;
  late DateTime _fecha;
  late TimeOfDay _hora;
  late String _lugar;
  late int _maxJugadores;

  @override
  void initState() {
    super.initState();
    _fecha = DateTime.now();
    _hora = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Crear equipo",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          child: ListView(padding: EdgeInsets.zero, children: [
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
                  Text('Crear equipo ', style: TextStyle(color: Colors.black)),
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
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Deporte',
                    prefixIcon: Icon(Icons.sports_soccer),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el deporte';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _deporte = value!;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Fecha',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa la fecha';
                    }
                    return null;
                  },
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _fecha,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _fecha = pickedDate;
                      });
                    }
                  },
                  readOnly: true,
                  controller: TextEditingController(
                      text: '${_fecha.day}/${_fecha.month}/${_fecha.year}'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Hora',
                    prefixIcon: Icon(Icons.access_time),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa la hora';
                    }
                    return null;
                  },
                  onTap: () async {
                    final pickedTime = await showTimePicker(
                      context: context,
                      initialTime: _hora,
                    );
                    if (pickedTime != null) {
                      setState(() {
                        _hora = pickedTime;
                      });
                    }
                  },
                  readOnly: true,
                  controller: TextEditingController(
                      text: '${_hora.hour}:${_hora.minute}'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Lugar',
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el lugar';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _lugar = value!;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Cantidad máxima de jugadores',
                    prefixIcon: Icon(Icons.person_add),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa la cantidad máxima de jugadores';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _maxJugadores = int.parse(value!);
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Aquí puedes enviar los datos a donde quieras
                      // por ejemplo, puedes imprimirlos en la consola
                      print('Deporte: $_deporte');
                      print('Fecha: $_fecha');
                      print('Hora: $_hora');
                      print('Lugar: $_lugar');
                      print('Cantidad máxima de jugadores: $_maxJugadores');
                    }
                  },
                  child: Text('Crear Equipo'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
