import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
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
            title: const Text('Crear equipo ',
                style: TextStyle(color: Colors.orange)),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Unirse a Juego ',
                style: TextStyle(color: Colors.orange)),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Reservar instalaciones ',
                style: TextStyle(color: Colors.orange)),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Realizar pago ',
                style: TextStyle(color: Colors.orange)),
            onTap: () {},
          ),
        ]),
      ),
      appBar: AppBar(
          title: const Text(
            "Bienvenido",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange),
    ));
  }
}
