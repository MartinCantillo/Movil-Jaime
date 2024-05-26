import 'dart:convert';

class Reserva {
  int? id;
  int? usuarioId;
  int? instalacionId;
  DateTime? fecha;
  DateTime? horaInicio;
  DateTime? horaFin;
  bool? estadoPago;

  Reserva({
    this.id,
    this.usuarioId,
    this.instalacionId,
    this.fecha,
    this.horaInicio,
    this.horaFin,
    this.estadoPago,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'instalacionId': instalacionId,
      'fecha': fecha?.millisecondsSinceEpoch,
      'horaInicio': horaInicio?.millisecondsSinceEpoch,
      'horaFin': horaFin?.millisecondsSinceEpoch,
      'estadoPago': estadoPago,
    };
  }

  factory Reserva.fromMap(Map<String, dynamic> map) {
    return Reserva(
      id: map['id'],
      usuarioId: map['usuarioId'],
      instalacionId: map['instalacionId'],
      fecha: map['fecha'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['fecha'])
          : null,
      horaInicio: map['horaInicio'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['horaInicio'])
          : null,
      horaFin: map['horaFin'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['horaFin'])
          : null,
      estadoPago: map['estadoPago'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Reserva.fromJson(String source) =>
      Reserva.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Reserva(id: $id, usuarioId: $usuarioId, instalacionId: $instalacionId, fecha: $fecha, horaInicio: $horaInicio, horaFin: $horaFin, estadoPago: $estadoPago)';
  }
}
