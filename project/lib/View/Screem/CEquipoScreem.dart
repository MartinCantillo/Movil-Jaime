import 'package:flutter/material.dart';
import 'package:project/View/Screem/MyHomePage.dart';
import 'package:project/View/Screem/PagoScreem.dart';
import 'package:project/View/Screem/ReservarScreem.dart';
import 'package:project/View/Screem/UnirseJuegoScreem.dart';
import 'package:project/View/Widget/drawer.dart';

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
        appBar: AppBar(
          title: const Text(
            "Crear equipo",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Manejar notificaciones
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Manejar configuración
              },
            ),
          ],
        ),
        drawer:DrawerW(user: "Martin",correo: "Martin@gmail.com",),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  _buildTextField(
                    labelText: 'Deporte',
                    prefixIcon: Icons.sports_soccer,
                    onSaved: (value) => _deporte = value!,
                    validator: (value) => value!.isEmpty ? 'Por favor ingresa el deporte' : null,
                  ),
                  SizedBox(height: 10),
                  _buildDatePicker(
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
                  _buildTimePicker(
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
                  _buildTextField(
                    labelText: 'Lugar',
                    prefixIcon: Icons.location_on,
                    onSaved: (value) => _lugar = value!,
                    validator: (value) => value!.isEmpty ? 'Por favor ingresa el lugar' : null,
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    labelText: 'ID del creador',
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.number,
                    onSaved: (value) => _creadorId = int.parse(value!),
                    validator: (value) => value!.isEmpty ? 'Por favor ingresa el ID del creador' : null,
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Equipo creado exitosamente')),
                          );
                          // Aquí puedes manejar los datos como desees
                        }
                      },
                      child: Text('Crear Equipo'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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



  Widget _buildTextField({
    required String labelText,
    required IconData prefixIcon,
    required FormFieldSetter<String> onSaved,
    required FormFieldValidator<String> validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(),
      ),
      onSaved: onSaved,
      validator: validator,
      keyboardType: keyboardType,
    );
  }

  Widget _buildDatePicker({
    required BuildContext context,
    required String labelText,
    required IconData prefixIcon,
    required DateTime selectedDate,
    required Function(DateTime) onDateSelected,
  }) {
    return GestureDetector(
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          onDateSelected(pickedDate);
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Icon(prefixIcon),
            border: OutlineInputBorder(),
          ),
          controller: TextEditingController(
              text: '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
        ),
      ),
    );
  }

  Widget _buildTimePicker({
    required BuildContext context,
    required String labelText,
    required IconData prefixIcon,
    required TimeOfDay selectedTime,
    required Function(TimeOfDay) onTimeSelected,
  }) {
    return GestureDetector(
      onTap: () async {
        final pickedTime = await showTimePicker(
          context: context,
          initialTime: selectedTime,
        );
        if (pickedTime != null) {
          onTimeSelected(pickedTime);
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Icon(prefixIcon),
            border: OutlineInputBorder(),
          ),
          controller: TextEditingController(
              text: '${selectedTime.hour}:${selectedTime.minute}'),
        ),
      ),
    );
  }
}
