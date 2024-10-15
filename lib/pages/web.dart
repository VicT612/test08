import 'package:flutter/material.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _detallesController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  void _validacion() {
    if (_nombreController.text.isNotEmpty &&
        _tipoController.text.isNotEmpty &&
        _detallesController.text.isNotEmpty &&
        _fechaController.text.isNotEmpty &&
        _telefonoController.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Datos ingresados'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Nombre: ${_nombreController.text}'),
                  Text('Teléfono: ${_telefonoController.text}'),
                  Text('Tipo de queja: ${_tipoController.text}'),
                  Text('Fecha de queja: ${_fechaController.text}'),
                  Text('Detalles del reclamo: ${_detallesController.text}'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Faltan campos por rellenar'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Text('BIENVENIDO', style: TextStyle(fontSize: 30)),
            const SizedBox(
              height: 20,
            ),
            Image.asset('assets/images/moneda.gif', width: 200, height: 200),
            const SizedBox(
              height: 20,
            ),
            Text('QUEJATE AQUI', style: TextStyle(fontSize: 40),),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _nombreController,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Ingrese su nombre',
              fillColor: Colors.white,
              filled: true,
              labelText: 'Nombre',
            ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _telefonoController,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Ingrese su telefono',
              fillColor: Colors.white,
              filled: true,
              labelText: 'Telefono',
            ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _tipoController,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Tipo de queja',
              fillColor: Colors.white,
              filled: true,
              labelText: 'Tipo de queja',
            ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _fechaController,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'DD/MM/YYYY',
              fillColor: Colors.white,
              filled: true,
              labelText: 'Fecha de queja',
            ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _detallesController,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Detalles del reclamo',
              fillColor: Colors.white,
              filled: true,
              labelText:'Detalles del reclamo',
            ),
            ),
            const SizedBox(
              height: 20,
            ),   
            ElevatedButton(
              onPressed: _validacion,
              child: Text('Guardar'),
            ),  
            ],
          ),
        ),
      ),
    );
  }
}