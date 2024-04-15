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
      drawer: Drawer(backgroundColor: Colors.black , shadowColor: Colors.white),
      appBar: AppBar(title: const Text("Bienvenido", style: TextStyle(color: Colors.white),), centerTitle: true, backgroundColor:Colors.black ),
    ));
  }
}
