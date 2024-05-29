import 'package:flutter/material.dart';
import 'package:project/View/Screem/CEquipoScreem.dart';
import 'package:project/View/Screem/PagoScreem.dart';
import 'package:project/View/Screem/ReservarScreem.dart';
import 'package:project/View/Screem/UnirseJuegoScreem.dart';
import 'ppp.dart';
import 'mmmm.dart'; 

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const String nombre = 'MyHomePage';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bienvenido",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/images/homepage.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'El siguiente aplicativo se desarrollará para facilitar a los jóvenes la organización de actividades deportivas informales cuando deseen participar en deportes pero les falten compañeros de equipo. Además, la aplicación ofrecerá la posibilidad de alquilar instalaciones deportivas en caso de ser necesario. El propósito de la aplicación es promover un estilo de vida activo y saludable, facilitando la participación en deportes recreativos y la socialización entre los usuarios.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Selecciona una opción:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PppScreen(), // Ir a ppp.dart
                      ),
                    );
                  },
                  icon: Icon(Icons.star),
                  label: Text('Puntuación'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MmmmScreen(), // Ir a mmmm.dart
                      ),
                    );
                  },
                  icon: Icon(Icons.message),
                  label: Text('Comunicación'),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.black,
                ),
              ),
              _buildDrawerItem('Home', MyHomePage.nombre, Icons.home),
              _buildDrawerItem(
                  'Crear equipo', CEquipoScreem.nombre, Icons.group_add),
              _buildDrawerItem('Unirse a Juego', UnirseJuegoScreem.nombre,
                  Icons.sports_soccer),
              _buildDrawerItem('Reservar instalaciones', ReservarScreem.nombre,
                  Icons.sports_basketball),
              _buildDrawerItem(
                  'Realizar pago', PagoScreem.nombre, Icons.payment),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, String routeName, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
    );
  }
}
