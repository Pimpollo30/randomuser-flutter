import 'package:flutter/material.dart';
import 'package:randomuser/src/providers/persona_provider.dart';
import 'package:randomuser/src/widgets/card_persona_widget.dart';

class HomePage extends StatelessWidget {
  final personasProvider = new PersonasProvider();

  @override
  Widget build(BuildContext context) {
    personasProvider.getPersonas();
    return Scaffold(
      appBar: AppBar(
        title: Text("Random User Generator"),
        backgroundColor: Colors.deepPurple[300],
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (route) {
                Navigator.pushNamed(context, route);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                        height: 30, value: "acerca", child: Text("Acerca de"))
                  ])
        ],
      ),
      body: ListView(
        children: [
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Text("Personas",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          _footer(context),
        ],
      ),
    );
  }

  Widget _footer(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height,
      padding: EdgeInsets.only(left: 10),
      child: StreamBuilder(
          stream: personasProvider.popularesStream,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return MovieHorizontal(
                personas: snapshot.data,
                siguientePagina: personasProvider.getPersonas,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
