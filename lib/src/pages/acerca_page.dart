import 'package:flutter/material.dart';

class AcercaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acerca de"),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Random User Generator\n',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  "Random User es una API gratuita de código abierto para generar datos de usuarios de manera aleatoria. Como Lorem Ipsum, pero para personas.\n",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16)),
              Text(
                'La aplicación consume datos de la API que provee la generación aleatoria de datos de usuarios.\n',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "Sitio web: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  TextSpan(
                      text: "https://randomuser.me/\n",
                      style: TextStyle(fontSize: 16)),
                ], style: TextStyle(color: Colors.black)),
              ),
              Text(
                "Desarrollado por:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "José Abraham",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          )),
    );
  }
}
