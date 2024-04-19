import 'package:flutter/material.dart';
import 'package:project/View/Screem/CEquipoScreem.dart';
import 'package:project/View/Screem/PagoScreem.dart';
import 'package:project/View/Screem/ReservarScreem.dart';
import 'package:project/View/Screem/UnirseJuegoScreem.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const String nombre = 'MyHomePage';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.black,
          shadowColor: Colors.black,
          child: ListView(padding: EdgeInsets.zero, children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Icon(
                Icons.person,
                size: 100,
                color: Colors.black,
              ),
            ),
            ListTile(
              title:
                  const Text('Home ', style: TextStyle(color: Colors.orange)),
              onTap: () {
                Navigator.of(context).pushNamed(MyHomePage.nombre);
              },
            ),
            ListTile(
              title: const Text('Crear equipo ',
                  style: TextStyle(color: Colors.orange)),
              onTap: () {
                Navigator.of(context).pushNamed(CEquipoScreem.nombre);
              },
            ),
            ListTile(
              title: const Text('Unirse a Juego ',
                  style: TextStyle(color: Colors.orange)),
              onTap: () {
                Navigator.of(context).pushNamed(UnirseJuegoScreem.nombre);
              },
            ),
            ListTile(
              title: const Text('Reservar instalaciones ',
                  style: TextStyle(color: Colors.orange)),
              onTap: () {
                Navigator.of(context).pushNamed(ReservarScreem.nombre);
              },
            ),
            ListTile(
              title: const Text('Realizar pago ',
                  style: TextStyle(color: Colors.orange)),
              onTap: () {
                Navigator.of(context).pushNamed(PagoScreem.nombre);
              },
            ),
          ]),
        ),
        appBar: AppBar(
          title: const Text(
            "Bienvenido",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/homepage.jpg',
                  fit: BoxFit.cover, // Para ajustar la imagen al contenedor
                ),
                SizedBox(height: 20),
                Text(
                  ' El suiguiente aplicativo se desarrollará para facilitar a los jóvenes la organización de actividades deportivas informales cuando deseen participar en deportes pero les falten compañeros de equipo. Además, la aplicación ofrecerá la posibilidad de alquilar instalaciones deportivas en caso de ser necesario. El propósito de la aplicación es promover un estilo de vida activo y saludable, facilitando la participación en deportes recreativos y la socialización entre los usuarios.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
