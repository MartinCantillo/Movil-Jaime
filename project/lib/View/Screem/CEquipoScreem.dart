import 'package:flutter/material.dart';
import 'package:project/View/Screem/MyHomePage.dart';
import 'package:project/View/Screem/ReservarScreem.dart';
import 'package:project/View/Screem/UnirseJuegoScreem.dart';

class CEquipoScreem extends StatefulWidget {
  const CEquipoScreem({super.key});
  static const String nombre = 'CEquipoScreem';
  @override
  State<CEquipoScreem> createState() => _CEquipoScreemState();
}

class _CEquipoScreemState extends State<CEquipoScreem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Crear Equipo ",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        shadowColor: Colors.white,
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
            title: const Text('Home ', style: TextStyle(color: Colors.orange)),
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
            onTap: () {},
          ),
        ]),
      ),
    ));
  }
}
