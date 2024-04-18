import 'package:flutter/material.dart';
import 'package:project/View/Screem/CEquipoScreem.dart';
import 'package:project/View/Screem/MyHomePage.dart';
import 'package:project/View/Screem/ReservarScreem.dart';
import 'package:project/View/Screem/UnirseJuegoScreem.dart';

class PagoScreem extends StatefulWidget {
  const PagoScreem({Key? key}) : super(key: key);
  static const String nombre = 'PagoScreem';

  @override
  State<PagoScreem> createState() => _PagoScreemState();
}

class _PagoScreemState extends State<PagoScreem> {
  bool _processingPayment = false;

  void _processPayment() {
    // Aquí deberías implementar la lógica para procesar el pago,
    // ya sea integrando una pasarela de pago como Stripe o PayPal.
    // Esto puede requerir llamadas a API, etc.
    setState(() {
      _processingPayment = true;
    });

    // Simulación de proceso de pago (espera de 2 segundos)
    Future.delayed(Duration(seconds: 2), () {
      // Lógica de confirmación de reserva y notificación al usuario

      // Ejemplo de notificación mediante un diálogo
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Pago completado'),
            content: Text('Tu pago ha sido procesado con éxito.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );

      setState(() {
        _processingPayment = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Realizar pago",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        drawer: Drawer(
          backgroundColor: Colors.black,
          shadowColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
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
            ],
          ),
        ),
        body: _processingPayment
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ElevatedButton(
                onPressed: _processPayment,
                child: Text('Pagar'),
              ),
      ),
    );
  }
}
