import 'package:project/Model/Equipo.dart';

final List<Equipo> equipos = [
  Equipo(
    id: 1,
    nombreDeporte: 'Fútbol',
    fecha: DateTime.now(),
    hora: DateTime.now(),
    lugar: 'Cancha 1',
    creadorId: 101,
    jugadoresNecesarios: 10,
    buscajugadores: true,
    jugadoresIds: [201, 202, 203],
  ),
  Equipo(
    id: 2,
    nombreDeporte: 'Baloncesto',
    fecha: DateTime.now(),
    hora: DateTime.now(),
    lugar: 'Cancha 2',
    creadorId: 102,
    jugadoresNecesarios: 5,
    buscajugadores: false,
    jugadoresIds: [204, 205],
  ),
  Equipo(
    id: 20,
    nombreDeporte: 'Voleibol',
    fecha: DateTime.now(),
    hora: DateTime.now(),
    lugar: 'Cancha 3',
    creadorId: 103,
    jugadoresNecesarios: 6,
    buscajugadores: true,
    jugadoresIds: [206, 207, 208],
  ),
];
