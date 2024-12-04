import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modelo/zapato.dart';
import '../logica/carrito_logica.dart';
import '../rutas/app_rutas.dart';

class PantallaZapatos extends StatelessWidget {
  final String categoria;
  final List<Zapato> zapatos;

  const PantallaZapatos({
    super.key,
    required this.categoria,
    required this.zapatos,
  });

  @override
  Widget build(BuildContext context) {
    final carrito = Provider.of<CarritoLogica>(context);

    // Filter shoes by category
    final zapatosFiltrados = zapatos.where((zapato) => zapato.categoria == categoria).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Zapatos $categoria'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, AppRutas.carrito);
            },
          ),
        ],
      ),
      body: zapatosFiltrados.isEmpty
          ? Center(
        child: Text('No hay zapatos en la categoría $categoria'),
      )
          : ListView.builder(
        itemCount: zapatosFiltrados.length,
        itemBuilder: (context, index) {
          final zapato = zapatosFiltrados[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.network(
                zapato.imagen,
                width: 50,
                fit: BoxFit.cover,
              ),
              title: Text(zapato.nombre),
              subtitle: Text('Precio: \$${zapato.precio.toStringAsFixed(2)}'),
              trailing: ElevatedButton(
                onPressed: () {
                  carrito.agregarZapato(zapato);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${zapato.nombre} añadido al carrito'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Comprar'),
              ),
            ),
          );
        },
      ),
    );
  }
}