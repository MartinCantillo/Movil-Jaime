import 'package:flutter/material.dart';

class PppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistema de Puntuación y Confiabilidad'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Calificación del Usuario:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildRatingStars(
                4.5), // Muestra la calificación (ejemplo: 4.5 estrellas)
            SizedBox(height: 20),
            Text(
              'Comentarios:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildComments(), // Muestra los comentarios de otros usuarios
          ],
        ),
      ),
    );
  }

  // Método para construir las estrellas de la calificación
  Widget _buildRatingStars(double rating) {
    int fullStars = rating.floor();
    double halfStars = rating - fullStars;
    List<Widget> stars = [];

    // Agrega estrellas llenas
    for (int i = 0; i < fullStars; i++) {
      stars.add(Icon(Icons.star, color: Colors.orange));
    }

    // Agrega media estrella si es necesario
    if (halfStars > 0) {
      stars.add(Icon(Icons.star_half, color: Colors.orange));
    }

    // Agrega estrellas vacías para completar 5
    for (int i = 0; i < (5 - rating).floor(); i++) {
      stars.add(Icon(Icons.star_border, color: Colors.orange));
    }

    return Row(
      children: stars,
    );
  }

  // Método para construir los comentarios de otros usuarios
  Widget _buildComments() {
    // Lista de comentarios de ejemplo (se pueden cargar desde una fuente de datos)
    List<String> comments = [
      'Muy buen compañero de equipo, siempre participa con entusiasmo.',
      'Excelente puntualidad, llega a tiempo a todos los juegos.',
      'Muestra un comportamiento deportivo ejemplar en cada partido.',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: comments.map((comment) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            '- $comment',
            style: TextStyle(fontSize: 16),
          ),
        );
      }).toList(),
    );
  }
}

class Equipo {
  final String nombre;
  final double puntuacion;

  Equipo(this.nombre, this.puntuacion);
}

List<Equipo> equipos = [
  Equipo('Los Tigres', 4.5),
  Equipo('Los Leones', 3.8),
  Equipo('Los Halcones', 4.2),
  Equipo('Los Dragones', 4.7),
  Equipo('Los Lobos', 4.0),
];

class EquipoListItem extends StatelessWidget {
  final Equipo equipo;

  const EquipoListItem({required this.equipo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(equipo.nombre),
      trailing: _buildRatingStars(equipo.puntuacion),
    );
  }

  Widget _buildRatingStars(double rating) {
    int fullStars = rating.floor();
    double halfStars = rating - fullStars;
    List<Widget> stars = [];

    // Agrega estrellas llenas
    for (int i = 0; i < fullStars; i++) {
      stars.add(Icon(Icons.star, color: Colors.orange, size: 20));
    }

    // Agrega media estrella si es necesario
    if (halfStars > 0) {
      stars.add(Icon(Icons.star_half, color: Colors.orange, size: 20));
    }

    // Agrega estrellas vacías para completar 5
    for (int i = 0; i < (5 - rating).floor(); i++) {
      stars.add(Icon(Icons.star_border, color: Colors.orange, size: 20));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}
