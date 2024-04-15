import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SPORT CHAMPIONS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Usuario',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su nombre de usuario';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Contraseña',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su contraseña';
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle login logic here
                    print('Usuario: ${_usernameController.text}');
                    print('Contraseña: ${_passwordController.text}');
                  }
                },
                child: Text('Iniciar sesión'),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Handle forgot password logic here
                  print('Olvidaste tu contraseña');
                },
                child: Text('¿Olvidaste tu contraseña?'),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Handle create new account logic here
                  print('Crear cuenta nueva');
                },
                child: Text('Crear cuenta nueva'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
