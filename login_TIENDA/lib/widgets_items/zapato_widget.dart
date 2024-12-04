import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modelo/zapato.dart';
import '../logica/carrito_logica.dart';

class ZapatoWidget extends StatelessWidget {
  final Zapato zapato;

  const ZapatoWidget({Key? key, required this.zapato}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carrito = Provider.of<CarritoLogica>(context, listen: false);

    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(
          zapato.imagen,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(zapato.nombre),
        subtitle: Text('\$${zapato.precio.toStringAsFixed(2)}'),
        trailing: IconButton(
          icon: const Icon(Icons.add_shopping_cart),
          onPressed: () {
            carrito.agregarZapato(zapato);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${zapato.nombre} agregado al carrito')),
            );
          },
        ),
      ),
    );
  }
}