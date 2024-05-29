import 'package:flutter/material.dart';
import 'package:project/View/Screem/CEquipoScreem.dart';
import 'package:project/View/Screem/MyHomePage.dart';
import 'package:project/View/Screem/ReservarScreem.dart';
import 'package:project/View/Screem/UnirseJuegoScreem.dart';
import 'package:project/View/Widget/AppBarW.dart';
import 'package:project/View/Widget/drawer.dart';

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
        appBar:AppBarW(title: "Realizar pago"),
        drawer:  DrawerW(user: "Martin",correo: "Martin@gmail.com",),
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
