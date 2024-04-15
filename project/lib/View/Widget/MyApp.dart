import 'package:flutter/material.dart';
import 'package:project/View/Screem/LoginPage.dart';
import 'package:project/View/Screem/MyHomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movil1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LoginPage.nombre,
      routes: {
        LoginPage.nombre: (context) => LoginPage(),
        MyHomePage.nombre: (context) => const MyHomePage(),
      },
      //home: LoginPage(),
    );
  }
}
