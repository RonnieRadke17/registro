import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
bool _passwordVisible = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sharing data between screens',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _result;
  final nombre = TextEditingController(text: "");
  final aPaterno = TextEditingController(text: "");
  final aMaterno = TextEditingController(text: "");
  final smgrp = TextEditingController(text: "");
  final password = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('uso del cubrebocas?'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image.asset('assets/cubrebocas.jpeg', height: 200, width: 200),
          TextField(
            controller: nombre,
            style: TextStyle(fontFamily: 'Garamond', fontSize: 15, color: Colors.black),
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nombre',
            ),
          ),
          TextField(
            controller: aPaterno,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Usuario',
            ),
          ),
          TextField(
            controller: aMaterno,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Crees necesario el uso de cubrebocas?',
            ),
          ),
          TextField(
            controller: smgrp,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Te ha ayudado el cubrebocas?',
            ),
          ),
          TextField(
            controller: password,
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Contraseña',
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
          ),
          ButtonBar(
            children: <Widget>[
              OutlinedButton(
                onPressed: () => goAhead(true),
                child: Text("Contestar"),
              ),
              OutlinedButton(
                onPressed: () => goAhead(false),
                child: Text("Ingresar"),
              ),
            ],
          ),
          Text(_result != null ? "Result from second page: '$_result'" : "")
        ]),
      ),
    );
  }

  Future<void> goAhead(bool standardType) async {
    var result;
    if (standardType) {
      result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(nombre.text),
          ));
    } else {
      result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TercerPagina(nombre.text, aPaterno.text, aMaterno.text, smgrp.text),
            settings: RouteSettings(
              arguments: nombre.text,
            ),
          ));
    }

    if (result != null) {
      setState(() {
        _result = result;
      });
    }
  }
}

class SecondPage extends StatelessWidget {
  //pantalla 2
  final String? _title;
  final direccion = TextEditingController(text: "");
  final calle = TextEditingController(text: "");
  final numero = TextEditingController(text: "");
  final colonia = TextEditingController(text: "");
  final ciudad = TextEditingController(text: "");
  final municipio = TextEditingController(text: "");
  final estado = TextEditingController(text: "");
  final correo = TextEditingController(text: "");
  final fechaNacimiento = TextEditingController(text: "");
  final carrera = TextEditingController(text: "");
  final generacion = TextEditingController(text: "");
  SecondPage([this._title]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda pantalla'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Text("Datos obtenidos: $_title"),
          /*TextField(
            controller: direccion,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Direccion',
            ),
          ),*/
          TextField(
            controller: calle,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Crees en el covid?',
            ),
          ),
          TextField(
            controller: numero,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Te ha dado?',
            ),
          ),
          TextField(
            controller: colonia,
            obscureText: false,
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Tienes algúnos sintomas?'),
          ),
          /*TextField(
            controller: ciudad,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ciudad',
            ),
          ),*/
          TextField(
            controller: municipio,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Cuáles?',
            ),
          ),
          ButtonBar(
            children: <Widget>[
              OutlinedButton(
                onPressed: () => returnWithValue(context),
                child: Text("Salir"),
              ),
            ],
          ),
        ],
      )),
    );
  }

  void returnWithValue(BuildContext context) {
    Navigator.pop(context, direccion.text);
  }
}

//aqui va el metodo

class TercerPagina extends StatelessWidget {
  //pagina 3
  final semestre = TextEditingController(text: "");
  final generacion = TextEditingController(text: "");
  final carrera = TextEditingController(text: "");
  final String? nombre;
  final String? apellidoP;
  final String? apellidoM;
  final String? gradoyGrupo;
  TercerPagina([this.nombre, this.apellidoP, this.apellidoM, this.gradoyGrupo]);

  String valordropdown = "Semestre";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos de inscripción'),
      ),
      body: Center(
          child: Column(children: <Widget>[
        Text("Bienvenid@: $nombre $apellidoM"),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/imagen.png', height: 200, width: 150), //si está bien
            TextField(
              controller: semestre,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Crees qué la vacuna ayude?',
              ),
            ),
            TextField(
              controller: carrera,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Te has vacunado?',
              ),
            ),
            TextField(
              controller: generacion,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Con qué vacuna?',
              ),
            ),

            //boton de salir
            ButtonBar(
              children: <Widget>[
                OutlinedButton(
                  onPressed: () => returnWithValue(context),
                  child: Text("Salir"),
                ),
              ],
            ),
          ],
        )
      ])),
    );
  }

  void returnWithValue(BuildContext context) {
    Navigator.pop(context, "Cambiar texto");
  }
}
