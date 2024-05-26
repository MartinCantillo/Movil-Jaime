import 'dart:convert';

import 'package:flutter/widgets.dart';

class InstalacionDeportiva {
  int? id;
  String? tipo;
  String? ubicacion;
  bool? disponibilidad;
  InstalacionDeportiva({
    this.id,
    this.tipo,
    this.ubicacion,
    this.disponibilidad,
  });

  InstalacionDeportiva copyWith({
    ValueGetter<int?>? id,
    ValueGetter<String?>? tipo,
    ValueGetter<String?>? ubicacion,
    ValueGetter<bool?>? disponibilidad,
  }) {
    return InstalacionDeportiva(
      id: id != null ? id() : this.id,
      tipo: tipo != null ? tipo() : this.tipo,
      ubicacion: ubicacion != null ? ubicacion() : this.ubicacion,
      disponibilidad: disponibilidad != null ? disponibilidad() : this.disponibilidad,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tipo': tipo,
      'ubicacion': ubicacion,
      'disponibilidad': disponibilidad,
    };
  }

  factory InstalacionDeportiva.fromMap(Map<String, dynamic> map) {
    return InstalacionDeportiva(
      id: map['id']?.toInt(),
      tipo: map['tipo'],
      ubicacion: map['ubicacion'],
      disponibilidad: map['disponibilidad'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InstalacionDeportiva.fromJson(String source) => InstalacionDeportiva.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InstalacionDeportiva(id: $id, tipo: $tipo, ubicacion: $ubicacion, disponibilidad: $disponibilidad)';
  }

 
}
