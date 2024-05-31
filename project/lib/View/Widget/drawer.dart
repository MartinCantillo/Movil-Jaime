import 'package:flutter/material.dart';
import 'package:project/View/Screem/CEquipoScreem.dart';
import 'package:project/View/Screem/ComentariosScreem.dart';
import 'package:project/View/Screem/MyHomePage.dart';
import 'package:project/View/Screem/ReservarScreem.dart';
import 'package:project/View/Screem/UnirseJuegoScreem.dart';

class DrawerW extends StatefulWidget {
 final  String? user;
  final String? correo;
  DrawerW({
    Key? key,
    this.user,
    this.correo,
  }) : super(key: key);

  @override
  State<DrawerW> createState() => _DrawerWState();
}

class _DrawerWState extends State<DrawerW> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(padding: EdgeInsets.zero, children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          accountName: Text(widget.user ?? 'Usuario',
              style: TextStyle(color: Colors.white)),
          accountEmail: Text(widget.correo ?? 'Usuario',
              style: TextStyle(color: Colors.white70)),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 50, color: Colors.blue),
          ),
        ),
        _buildDrawerItem(
          icon: Icons.home,
          text: 'Home',
          onTap: () => Navigator.of(context).pushNamed(MyHomePage.nombre),
        ),
        _buildDrawerItem(
          icon: Icons.sports_soccer,
          text: 'Crear equipo',
          onTap: () => Navigator.of(context).pushNamed(CEquipoScreem.nombre),
        ),
        _buildDrawerItem(
          icon: Icons.group,
          text: 'Unirse a Juego',
          onTap: () =>
              Navigator.of(context).pushNamed(UnirseJuegoScreem.nombre),
        ),
        _buildDrawerItem(
          icon: Icons.calendar_today,
          text: 'Reservar instalaciones',
          onTap: () => Navigator.of(context).pushNamed(ReservarScreem.nombre),
        ),
        _buildDrawerItem(
          icon: Icons.payment,
          text: 'Comentarios',
          onTap: () => Navigator.of(context).pushNamed(ComemtariosS.nombre),
        ),
      ]),
    );
  }
}

Widget _buildDrawerItem(
    {required IconData icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: [
        Icon(icon, color: Colors.black),
        SizedBox(width: 10),
        Text(text, style: TextStyle(color: Colors.black)),
      ],
    ),
    onTap: onTap,
  );
}
