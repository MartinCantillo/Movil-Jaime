import 'package:flutter/material.dart';
import 'package:project/View/Screem/CEquipoScreem.dart';
import 'package:project/View/Screem/MyHomePage.dart';
import 'package:project/View/Screem/PagoScreem.dart';
import 'package:project/View/Screem/ReservarScreem.dart';
import 'package:project/View/Widget/drawer.dart';

class UnirseJuegoScreem extends StatefulWidget {
  const UnirseJuegoScreem({Key? key}) : super(key: key);

  static const String nombre = 'UnirseJuegoScreem';

  @override
  State<UnirseJuegoScreem> createState() => _UnirseJuegoScreemState();
}

class _UnirseJuegoScreemState extends State<UnirseJuegoScreem> {
  late String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Unirse a un juego",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        drawer:  DrawerW(user: "Martin",correo: "Martin@gmail.com",),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Buscar equipo',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            Expanded(
              child: _buildTeamList(),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir la lista de equipos según el criterio de búsqueda
  Widget _buildTeamList() {
    // Aquí puedes implementar la lógica para filtrar los equipos según el criterio de búsqueda
    // y luego construir una lista de widgets que representen los equipos encontrados.
    // Por ejemplo:
    List<Widget> teams =
        []; // Aquí deberías llenar esta lista con los widgets de los equipos encontrados.

    // Ejemplo de cómo agregar un widget de equipo a la lista:
    teams.add(
      ListTile(
        title: Text('Nombre del equipo'),
        subtitle: Text('Descripción del equipo'),
        onTap: () {
          // Aquí puedes definir qué hacer cuando se seleccione un equipo de la lista.
        },
      ),
    );

    // Devolver la lista de widgets de equipos
    return ListView(
      children: teams,
    );
  }
}
