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
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _pinController = TextEditingController();

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
                title: Row(
                  children: [
                    Icon(Icons.home, color: Colors.orange),
                    SizedBox(width: 10),
                    Text('Home ', style: TextStyle(color: Colors.orange)),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(MyHomePage.nombre);
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.sports_soccer, color: Colors.orange),
                    SizedBox(width: 10),
                    Text('Crear equipo ',
                        style: TextStyle(color: Colors.orange)),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(CEquipoScreem.nombre);
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.group, color: Colors.orange),
                    SizedBox(width: 10),
                    Text('Unirse a Juego ',
                        style: TextStyle(color: Colors.orange)),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(UnirseJuegoScreem.nombre);
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.orange),
                    SizedBox(width: 10),
                    Text('Reservar instalaciones ',
                        style: TextStyle(color: Colors.orange)),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(ReservarScreem.nombre);
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.payment, color: Colors.orange),
                    SizedBox(width: 10),
                    Text('Realizar pago ',
                        style: TextStyle(color: Colors.orange)),
                  ],
                ),
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
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _cardNumberController,
                      decoration: InputDecoration(
                        labelText: 'Número de tarjeta',
                      ),
                    ),
                    TextField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                      ),
                    ),
                    TextField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Apellido',
                      ),
                    ),
                    TextField(
                      controller: _pinController,
                      decoration: InputDecoration(
                        labelText: 'PIN',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _processPayment();
                      },
                      child: Text('Pagar'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  // Función para procesar el pago
  void _processPayment() {
    // Aquí deberías implementar la lógica para procesar el pago
    // Esta lógica puede variar dependiendo de la pasarela de pago que utilices
    // Por ejemplo, si usas Stripe, deberías llamar a su API para crear un pago

    // Simulación de proceso de pago (espera de 2 segundos)
    setState(() {
      _processingPayment = true;
    });
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
}
