import 'package:flutter/material.dart';
import 'package:randomuser/src/models/persona_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Persona> personas;

  MovieHorizontal({@required this.personas, @required this.siguientePagina});

  final _pageController =
      new PageController(initialPage: 2, viewportFraction: 0.2);
  final Function siguientePagina;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });
    return PageView.builder(
      scrollDirection: Axis.vertical,
      pageSnapping: false,
      itemCount: personas.length,
      itemBuilder: (context, index) {
        return _card(context, personas[index]);
      },
      controller: _pageController,
    );
  }

  Widget _card(BuildContext context, Persona persona) {
    final tarjeta = Container(
        decoration: BoxDecoration(),
        margin: EdgeInsets.only(right: 15),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FadeInImage(
                      placeholder: AssetImage("assets/img/no-image.jpg"),
                      image: NetworkImage(persona.getImg()),
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100),
                ),
                SizedBox(width: 7),
                Flexible(
                  child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: persona.nameTitle + " ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    persona.nameFirst + " " + persona.nameLast,
                                style: TextStyle(fontSize: 16)),
                          ])),
                )
              ],
            ),
            SizedBox(height: 7),
            Divider(
              thickness: 2,
            ),
          ],
        ));
    return GestureDetector(
      child: tarjeta,
      onTap: () {
        Navigator.pushNamed(context, "detalle", arguments: persona);
      },
    );
  }
}
