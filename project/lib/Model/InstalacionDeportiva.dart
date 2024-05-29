import 'dart:convert';

class InstalacionDeportiva {
  int? id;
  String? nombreInstalacion;
  String? tipo;
  String? ubicacion;
  bool? disponibilidad;
  InstalacionDeportiva({
    this.id,
    this.nombreInstalacion,
    this.tipo,
    this.ubicacion,
    this.disponibilidad,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombreInstalacion': nombreInstalacion,
      'tipo': tipo,
      'ubicacion': ubicacion,
      'disponibilidad': disponibilidad,
    };
  }

  factory InstalacionDeportiva.fromMap(Map<String, dynamic> map) {
    return InstalacionDeportiva(
      id: map['id']?.toInt(),
      nombreInstalacion: map['nombreInstalacion'],
      tipo: map['tipo'],
      ubicacion: map['ubicacion'],
      disponibilidad: map['disponibilidad'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InstalacionDeportiva.fromJson(String source) =>
      InstalacionDeportiva.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InstalacionDeportiva(id: $id, nombreIntalacion: $nombreInstalacion, tipo: $tipo, ubicacion: $ubicacion, disponibilidad: $disponibilidad)';
  }
}
