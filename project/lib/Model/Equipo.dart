import 'dart:convert';


class Equipo {
  int? id;
  String? nombreDeporte;
  String? nombreEquipo;
  DateTime? fecha;
  DateTime? hora;
  String? lugar;
  int? creadorId;
  int? jugadoresNecesarios;
  bool? buscajugadores; // true o false
  List<int>? jugadoresIds;
  Equipo({
    this.id,
    this.nombreDeporte,
    this.nombreEquipo,
    this.fecha,
    this.hora,
    this.lugar,
    this.creadorId,
    this.jugadoresNecesarios,
    this.buscajugadores,
    this.jugadoresIds,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombreDeporte': nombreDeporte,
      'nombreEquipo': nombreEquipo,
      'fecha': fecha?.millisecondsSinceEpoch,
      'hora': hora?.millisecondsSinceEpoch,
      'lugar': lugar,
      'creadorId': creadorId,
      'jugadoresNecesarios': jugadoresNecesarios,
      'buscajugadores': buscajugadores,
      'jugadoresIds': jugadoresIds,
    };
  }

  factory Equipo.fromMap(Map<String, dynamic> map) {
    return Equipo(
      id: map['id']?.toInt(),
      nombreDeporte: map['nombreDeporte'],
      nombreEquipo: map['nombreEquipo'],
      fecha: map['fecha'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['fecha'])
          : null,
      hora: map['hora'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['hora'])
          : null,
      lugar: map['lugar'],
      creadorId: map['creadorId']?.toInt(),
      jugadoresNecesarios: map['jugadoresNecesarios']?.toInt(),
      buscajugadores: map['buscajugadores'],
      jugadoresIds: List<int>.from(map['jugadoresIds']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Equipo.fromJson(String source) => Equipo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Equipo(id: $id, nombreDeporte: $nombreDeporte, nombreEquipo: $nombreEquipo, fecha: $fecha, hora: $hora, lugar: $lugar, creadorId: $creadorId, jugadoresNecesarios: $jugadoresNecesarios, buscajugadores: $buscajugadores, jugadoresIds: $jugadoresIds)';
  }
}
