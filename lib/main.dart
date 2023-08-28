import 'package:flutter/material.dart';
import 'package:randomuser/src/pages/acerca_page.dart';
import 'package:randomuser/src/pages/home_page.dart';
import 'package:randomuser/src/pages/persona_detalle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generador de usuarios aleatorios',
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => HomePage(),
        "detalle": (BuildContext context) => PersonaDetalle(),
        "acerca": (BuildContext context) => AcercaPage()
      },
    );
  }
}
