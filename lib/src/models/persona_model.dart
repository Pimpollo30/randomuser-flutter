import 'package:intl/intl.dart';

class Personas {
  List<Persona> items = new List();

  Personas();

  Personas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final persona = new Persona.fromJsonMap(item);
      items.add(persona);
    }
  }
}

class Persona {
  String gender;
  String nameTitle;
  String nameFirst;
  String nameLast;
  int streetNumber;
  String streetName;
  String city;
  String state;
  String country;
  var postcode;
  String email;
  String loginUsername;
  String loginPassword;
  String dobDate;
  int dobAge;
  String phone;
  String cell;
  String picture;
  String nat;

  Persona({
    this.gender,
    this.nameTitle,
    this.nameFirst,
    this.nameLast,
    this.streetNumber,
    this.streetName,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.email,
    this.loginUsername,
    this.loginPassword,
    this.dobDate,
    this.dobAge,
    this.phone,
    this.cell,
    this.picture,
    this.nat,
  });

  Persona.fromJsonMap(Map<String, dynamic> json) {
    gender = json['gender'];
    nameTitle = json['name']['title'];
    nameFirst = json['name']['first'];
    nameLast = json['name']['last'];
    streetNumber = json['location']['street']['number'];
    streetName = json['location']['street']['name'];
    city = json['location']['city'];
    state = json['location']['state'];
    country = json['location']['country'];
    postcode = json['location']['postcode'];
    email = json['email'];
    loginUsername = json['login']['username'];
    loginPassword = json['login']['password'];
    // dobDate= json['dob']['date'];
    dobDate =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(json['dob']['date']));
    dobAge = json['dob']['age'];
    phone = json['phone'];
    cell = json['cell'];
    picture = json['picture']['large'];
    nat = json['nat'];
  }

  getImg() {
    if (picture == null) {
      return "https://st4.depositphotos.com/17828278/24401/v/600/depositphotos_244011872-stock-illustration-image-vector-symbol-missing-available.jpg";
    } else {
      return picture;
    }
  }
}
