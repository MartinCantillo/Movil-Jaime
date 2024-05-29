import 'package:flutter/material.dart';
import 'package:project/Data/EquipoData.dart';
import 'package:project/Model/Equipo.dart';
import 'package:project/View/Widget/AppBarW.dart';
import 'package:project/View/Widget/drawer.dart';

class UnirseJuegoScreem extends StatefulWidget {
  const UnirseJuegoScreem({Key? key}) : super(key: key);

  static const String nombre = 'UnirseJuegoScreem';

  @override
  State<UnirseJuegoScreem> createState() => _UnirseJuegoScreemState();
}

class _UnirseJuegoScreemState extends State<UnirseJuegoScreem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarW(title: "Unirse a un juego"),
        drawer: DrawerW(user: "Martin", correo: "Martin@gmail.com"),
        body: _buildTeamList(),
      ),
    );
  }

  Widget _buildTeamList() {
    final List<Equipo> filteredTeams =
        equipos.where((equipo) => equipo.buscajugadores == true).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: filteredTeams.map((equipo) {
          return InkWell(
            onTap: () {
              _showInputDialog(context, equipo);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(54),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.50),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 20),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    equipo.nombreEquipo ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Deporte: ${equipo.nombreDeporte ?? ''}',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _showInputDialog(context, equipo);
                    },
                    child: Text('Unirse'),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _showInputDialog(BuildContext context, Equipo equipo) {
    String codigo = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ingresar código'),
          content: TextField(
            onChanged: (value) => codigo = value,
            decoration: InputDecoration(
              hintText: 'Ingrese el código',
            ),
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
                print(
                    'Código ingresado para el equipo con ID: ${equipo.id}: $codigo');
                Navigator.pop(context);
              },
              child: Text('Guardar'),
            ),
          ],
        );
      },
    );
  }
}
