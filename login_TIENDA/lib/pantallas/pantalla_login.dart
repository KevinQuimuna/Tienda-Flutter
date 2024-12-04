import 'package:flutter/material.dart';
import '../logica/logica_login.dart';

class PantallaLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PantallaLoginState();
}

class PantallaLoginState extends State<PantallaLogin> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final LogicaLogin _logicaLogin = LogicaLogin();
  String mensajeError = '';

  void iniciarSesion() {
    final String usuario = _usuarioController.text;
    final String contrasena = _contrasenaController.text;

    if (_logicaLogin.validarCredenciales(usuario, contrasena)) {
      Navigator.pushReplacementNamed(context, '/pantallaBienvenida',
          arguments: usuario);
    } else {
      setState(() {
        mensajeError = 'Usuario o contraseña incorrectos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesión'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow, Colors.blueAccent, Colors.green],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _usuarioController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person, color: Colors.blue),
                    hintText: 'Usuario',
                    hintStyle: const TextStyle(color: Colors.blue),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _contrasenaController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                    hintText: 'Contraseña',
                    hintStyle: const TextStyle(color: Colors.blue),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true, // Oculta la contraseña
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: iniciarSesion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Iniciar sesión'),
                ),
                const SizedBox(height: 10),
                if (mensajeError.isNotEmpty)
                  Text(
                    mensajeError,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
