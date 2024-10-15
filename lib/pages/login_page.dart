import 'package:flutter/material.dart';
import 'web.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  void _validacion() {
    const String correo = 'prueba@gmail.com';
    const String contrasena = 'prueba';

    if (_correoController.text == correo &&
        _contrasenaController.text == contrasena) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WebPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Datos erroneos'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 8, 24, 68),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Bienvenido',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/images/cargando.gif',
                      width: 200, height: 200),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _correoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Correo electronico',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _contrasenaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Contraseña',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: _validacion,
                    child: Text(
                      'Ingresar',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}