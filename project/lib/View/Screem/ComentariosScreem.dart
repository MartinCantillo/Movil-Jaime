import 'package:flutter/material.dart';
import 'package:project/Data/UsuarioData.dart';
import 'package:project/View/Widget/AppBarW.dart';
import 'package:project/View/Widget/drawer.dart';
import 'package:project/Model/Usuario.dart';

class ComemtariosS extends StatefulWidget {
  const ComemtariosS({super.key});

  static const String nombre = 'ComemtariosS';

  @override
  State<ComemtariosS> createState() => _ComemtariosSState();
}

class _ComemtariosSState extends State<ComemtariosS> {
  void _showAddCommentDialog(Usuario usuario) {
    final TextEditingController commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Agregar comentario a ${usuario.nombre}'),
          content: TextField(
            controller: commentController,
            decoration: InputDecoration(hintText: 'Escribe tu comentario aquí'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  usuario.comentarios?.add(commentController.text);
                });
                Navigator.of(context).pop();
              },
              child: Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarW(title: 'Comentarios'),
      drawer: DrawerW(user: "Martin", correo: "Martin@gmail.com"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 3 / 4,
          ),
          itemCount: usuarios.length,
          itemBuilder: (context, index) {
            final usuario = usuarios[index];
            return GestureDetector(
              onTap: () => _showAddCommentDialog(usuario),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
                shadowColor: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          child: Icon(Icons.person, size: 40, color: Colors.white),
                          radius: 30,
                          backgroundColor: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        usuario.nombre??"",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                          fontFamily: 'RobotoMono',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Puntuación: ${usuario.puntuacion}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: 'RobotoMono',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Comentarios:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RobotoMono',
                        ),
                      ),
                      SizedBox(height: 8),
                      Expanded(
                        child: ListView.builder(
                          itemCount: usuario.comentarios?.length,
                          itemBuilder: (context, idx) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                '- ${usuario.comentarios?[idx]}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'RobotoMono',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}