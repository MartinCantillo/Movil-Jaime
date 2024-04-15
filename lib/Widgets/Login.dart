import 'package:flutter/material.dart';
import 'welcome_screen.dart'; // Import your WelcomeScreen class

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
              // Existing login form elements...

              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Navigate to Registro screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                  // Update the import statement to reference WelcomeScreen
                },
                child: Text('Crear cuenta nueva'),
              ),
              SizedBox(height: 16.0),
              // ...
            ],
          ),
        ),
      ),
    );
  }
}
