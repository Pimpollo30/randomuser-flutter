import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:randomuser/src/models/persona_model.dart';
import 'dart:convert';

class PersonasProvider {
  String _url = "randomuser.me";
  int _personasPage = 10;

  List<Persona> _populares = new List();

  final _personasStreamController = StreamController<List<Persona>>.broadcast();

  bool _cargando = false;

  void disposeStream() {
    _personasStreamController.close();
  }

  Function(List<Persona>) get personasSink =>
      _personasStreamController.sink.add;

  Stream<List<Persona>> get popularesStream => _personasStreamController.stream;

  Future<List<Persona>> procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final personas = new Personas.fromJsonList(decodeData["results"]);
    return personas.items;
  }

  Future<List<Persona>> getPersonas() async {
    if (_cargando) return [];
    _cargando = true;
    final url = Uri.https(_url, "/api", {"results": _personasPage.toString()});
    final resp = await procesarRespuesta(url);
    _populares.addAll(resp);
    personasSink(_populares);
    _cargando = false;
    return resp;
  }
}
