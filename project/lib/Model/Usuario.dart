import 'dart:convert';

import 'package:flutter/widgets.dart';

class Usuario {
  int? id;
  String? nombre;
  String? email;
  String? contrasena;
  double? puntuacion;
  List<String>? comentarios;
  Usuario({
    this.id,
    this.nombre,
    this.email,
    this.contrasena,
    this.puntuacion,
    this.comentarios,
  });

  Usuario copyWith({
    ValueGetter<int?>? id,
    ValueGetter<String?>? nombre,
    ValueGetter<String?>? email,
    ValueGetter<String?>? contrasena,
    ValueGetter<double?>? puntuacion,
    ValueGetter<List<String>?>? comentarios,
  }) {
    return Usuario(
      id: id != null ? id() : this.id,
      nombre: nombre != null ? nombre() : this.nombre,
      email: email != null ? email() : this.email,
      contrasena: contrasena != null ? contrasena() : this.contrasena,
      puntuacion: puntuacion != null ? puntuacion() : this.puntuacion,
      comentarios: comentarios != null ? comentarios() : this.comentarios,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'email': email,
      'contrasena': contrasena,
      'puntuacion': puntuacion,
      'comentarios': comentarios,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id']?.toInt(),
      nombre: map['nombre'],
      email: map['email'],
      contrasena: map['contrasena'],
      puntuacion: map['puntuacion']?.toDouble(),
      comentarios: List<String>.from(map['comentarios']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) =>
      Usuario.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Usuario(id: $id, nombre: $nombre, email: $email, contrasena: $contrasena, puntuacion: $puntuacion, comentarios: $comentarios)';
  }
}
