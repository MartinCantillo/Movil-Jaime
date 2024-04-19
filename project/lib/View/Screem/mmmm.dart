import 'package:flutter/material.dart';

class MmmmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comunicación y Recordatorios'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Comunicación dentro del equipo:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildChatMessages(), // Muestra los mensajes de chat del equipo
            SizedBox(height: 20),
            Text(
              'Recordatorios de juegos y eventos:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildEventReminders(), // Muestra los recordatorios de eventos
          ],
        ),
      ),
    );
  }

  // Método para construir los mensajes de chat del equipo
  Widget _buildChatMessages() {
    // Lista de mensajes de chat de ejemplo (se pueden cargar desde una fuente de datos)
    List<String> chatMessages = [
      '¡Hola equipo! ¿Quién puede jugar el próximo sábado?',
      'Yo puedo jugar, ¡estoy emocionado!',
      'Genial, ¿a qué hora nos vemos?',
      'Propongo que nos encontremos a las 10:00 a.m. en el parque.',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: chatMessages.map((message) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            '- $message',
            style: TextStyle(fontSize: 16),
          ),
        );
      }).toList(),
    );
  }

  // Método para construir los recordatorios de eventos
  Widget _buildEventReminders() {
    // Lista de recordatorios de eventos de ejemplo (se pueden cargar desde una fuente de datos)
    List<String> eventReminders = [
      'Recuerden el juego de fútbol mañana a las 3:00 p.m.',
      'Confirmar la reserva de la cancha de tenis para el viernes.',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: eventReminders.map((reminder) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            '- $reminder',
            style: TextStyle(fontSize: 16),
          ),
        );
      }).toList(),
    );
  }
}
