import 'package:flutter/material.dart';
import 'package:randomuser/src/models/persona_model.dart';

class PersonaDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Persona persona = ModalRoute.of(context).settings.arguments;

    var appBarName =
        persona.nameTitle + " " + persona.nameFirst + " " + persona.nameLast;
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarName),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10),
              _crearAvatar(context, persona),
              _crearInformacion(persona),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _crearAvatar(BuildContext context, Persona persona) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                    image: NetworkImage(persona.getImg()),
                    width: 128,
                    height: 128)),
          ),
          SizedBox(height: 10),
          Text(
            persona.nameTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            persona.nameFirst + " " + persona.nameLast,
            style: TextStyle(fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  var generoConversion = {"female": "Femenino", "male": "Masculino"};
  Widget _crearInformacion(Persona persona) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: RichText(
          // overflow: TextOverflow.ellipsis,
          text: TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                  text: 'Datos personales\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: '  Nombre: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: persona.nameFirst + " " + persona.nameLast + "\n",
                  style: TextStyle(fontSize: 17)),
              TextSpan(
                  text: '  Género: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: generoConversion[persona.gender] + "\n",
                  style: TextStyle(fontSize: 17)),
              TextSpan(
                  text: '  Fecha de nacimiento: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: persona.dobDate + "\n", style: TextStyle(fontSize: 17)),
              TextSpan(
                  text: '  Edad: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: persona.dobAge.toString() + "\n",
                  style: TextStyle(fontSize: 17)),
              TextSpan(
                  text: '  Teléfono: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: persona.phone.toString() + "\n",
                  style: TextStyle(fontSize: 17)),
              TextSpan(
                  text: '  Celular: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: persona.cell.toString() + "\n",
                  style: TextStyle(fontSize: 17)),
              TextSpan(
                  text: '  Nacionalidad: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: persona.nat + "\n\n", style: TextStyle(fontSize: 17)),
              TextSpan(
                  text: 'Datos de inicio de sesión\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: '  Email: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: persona.email + "\n", style: TextStyle(fontSize: 17)),
              TextSpan(
                  text: '  Usuario: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: persona.loginUsername + "\n",
                  style: TextStyle(fontSize: 17)),
              TextSpan(
                  text: '  Contraseña: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: persona.loginPassword + "\n\n",
                  style: TextStyle(fontSize: 17)),
              TextSpan(
                  text: 'Ubicación\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: '  Calle: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: persona.streetName + "\n",
                  style: TextStyle(fontSize: 17)),
              TextSpan(
                  text: '  Número: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: persona.streetNumber.toString() + "\n",
                  style: TextStyle(fontSize: 17)),
              TextSpan(
                  text: '  Ciudad: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: persona.city.toString() + "\n",
                  style: TextStyle(fontSize: 17)),
              TextSpan(
                  text: '  Estado: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: persona.state + "\n", style: TextStyle(fontSize: 17)),
              TextSpan(
                  text: '  Código postal: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: persona.postcode.toString() + "\n",
                  style: TextStyle(fontSize: 17)),
              TextSpan(
                  text: '  País: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              TextSpan(
                  text: persona.country.toString() + "\n\n",
                  style: TextStyle(fontSize: 17)),
            ],
          ),
        ));
  }
}
