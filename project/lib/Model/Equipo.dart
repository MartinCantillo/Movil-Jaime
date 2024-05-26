import 'dart:convert';

class Equipo {
  int? id;
  String? nombreDeporte;
  DateTime? fecha;
  DateTime? hora;
  String? lugar;
  int? creadorId;
  int? jugadoresNecesarios;
  List<int>? jugadoresIds;
  Equipo({
    this.id,
    this.nombreDeporte,
    this.fecha,
    this.hora,
    this.lugar,
    this.creadorId,
    this.jugadoresNecesarios,
    this.jugadoresIds,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombreDeporte': nombreDeporte,
      'fecha': fecha?.millisecondsSinceEpoch,
      'hora': hora?.millisecondsSinceEpoch,
      'lugar': lugar,
      'creadorId': creadorId,
      'jugadoresNecesarios': jugadoresNecesarios,
      'jugadoresIds': jugadoresIds,
    };
  }

  factory Equipo.fromMap(Map<String, dynamic> map) {
    return Equipo(
      id: map['id']?.toInt(),
      nombreDeporte: map['nombreDeporte'],
      fecha: map['fecha'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['fecha'])
          : null,
      hora: map['hora'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['hora'])
          : null,
      lugar: map['lugar'],
      creadorId: map['creadorId']?.toInt(),
      jugadoresNecesarios: map['jugadoresNecesarios']?.toInt(),
      jugadoresIds: List<int>.from(map['jugadoresIds']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Equipo.fromJson(String source) => Equipo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Equipo(id: $id, nombreDeporte: $nombreDeporte, fecha: $fecha, hora: $hora, lugar: $lugar, creadorId: $creadorId, jugadoresNecesarios: $jugadoresNecesarios, jugadoresIds: $jugadoresIds)';
  }
}
