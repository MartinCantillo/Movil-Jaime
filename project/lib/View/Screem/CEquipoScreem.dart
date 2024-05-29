
import 'package:flutter/material.dart';
import 'package:project/View/Widget/AppBarW.dart';
import 'package:project/View/Widget/buildTextFieldW.dart';
import 'package:project/View/Widget/drawer.dart';


class CEquipoScreem extends StatefulWidget {
  const CEquipoScreem({Key? key}) : super(key: key);
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
  late int _creadorId;
  late int _maxJugadores;
  bool _buscaJugadores = false;

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
        appBar: AppBarW(title: "Crear Equipo"),
        drawer: DrawerW(user: "Martin", correo: "Martin@gmail.com"),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  buildTextField(
                    labelText: 'Deporte',
                    prefixIcon: Icons.sports_soccer,
                    onSaved: (value) => _deporte = value!,
                    validator: (value) =>
                        value!.isEmpty ? 'Por favor ingresa el deporte' : null,
                  ),
                  SizedBox(height: 10),
                  buildDatePicker(
                    context: context,
                    labelText: 'Fecha',
                    prefixIcon: Icons.calendar_today,
                    selectedDate: _fecha,
                    onDateSelected: (pickedDate) {
                      setState(() {
                        _fecha = pickedDate;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  buildTimePicker(
                    context: context,
                    labelText: 'Hora',
                    prefixIcon: Icons.access_time,
                    selectedTime: _hora,
                    onTimeSelected: (pickedTime) {
                      setState(() {
                        _hora = pickedTime;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  buildTextField(
                    labelText: 'Lugar',
                    prefixIcon: Icons.location_on,
                    onSaved: (value) => _lugar = value!,
                    validator: (value) =>
                        value!.isEmpty ? 'Por favor ingresa el lugar' : null,
                  ),
                  SizedBox(height: 10),
                  buildTextField(
                    labelText: 'ID del creador',
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.number,
                    onSaved: (value) => _creadorId = int.parse(value!),
                    validator: (value) => value!.isEmpty
                        ? 'Por favor ingresa el ID del creador'
                        : null,
                  ),
                  SizedBox(height: 10),
                  buildTextField(
                    labelText: 'Cantidad máxima de jugadores',
                    prefixIcon: Icons.person_add,
                    keyboardType: TextInputType.number,
                    onSaved: (value) => _maxJugadores = int.parse(value!),
                    validator: (value) => value!.isEmpty
                        ? 'Por favor ingresa la cantidad máxima de jugadores'
                        : null,
                  ),
                  SizedBox(height: 10),
                  SwitchListTile(
                    title: Text("¿Buscar jugadores?"),
                    value: _buscaJugadores,
                    onChanged: (value) {
                      setState(() {
                        _buscaJugadores = value;
                      });
                    },
                    secondary: Icon(Icons.search),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _crearEquipo();
                        }
                      },
                      child: Text('Crear Equipo'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _crearEquipo() {
    final equipo = {
      'deporte': _deporte,
      'fecha': _fecha,
      'hora': _hora,
      'lugar': _lugar,
      'creadorId': _creadorId,
      'maxJugadores': _maxJugadores,
      'buscaJugadores': _buscaJugadores,
    };
    print('Equipo creado: $equipo');
    // Aquí puedes manejar los datos como desees
  }
}
