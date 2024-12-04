import 'package:flutter/material.dart';
import 'package:login/pantallas/pantalla_bienvenida.dart';
import 'package:login/pantallas/pantalla_seleccion_categoria.dart';
import 'package:provider/provider.dart';
import 'pantallas/pantalla_login.dart';
import 'pantallas/pantalla_categoria_zapatos.dart';
import 'pantallas/pantalla_carrito.dart';
import 'pantallas/pantalla_factura.dart';
import 'logica/carrito_logica.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CarritoLogica(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda de Zapatos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PantallaLogin(),
        '/pantallaBienvenida': (context) => PantallaBienvenida(usuario: '',),
        '/categorias': (context) => PantallaSeleccionCategorias(),
        '/carrito': (context) => PantallaCarrito(),
        '/factura': (context) => const PantallaFactura(),
      },
      // Uso de onGenerateRoute para rutas que requieren parámetros
      onGenerateRoute: (settings) {
        if (settings.name == '/pantallaBienvenida') {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) {
              return PantallaBienvenida(usuario: args);
            },
          );
        }
        return null;
      },
    );
  }
}
