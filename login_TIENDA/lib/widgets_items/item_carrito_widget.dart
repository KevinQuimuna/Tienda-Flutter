import 'package:flutter/material.dart';
import '../modelo/item_carrito.dart';
import '../logica/carrito_logica.dart';
import 'package:provider/provider.dart';

class ItemCarritoWidget extends StatelessWidget {
  final ItemCarrito item;

  const ItemCarritoWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final carrito = Provider.of<CarritoLogica>(context);

    return Card(
      child: ListTile(
        leading: Image.network(
          item.zapato.imagen,
          width: 50,
          fit: BoxFit.cover,
        ),
        title: Text(item.zapato.nombre),
        subtitle: Text('Cantidad: ${item.cantidad}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                carrito.eliminarZapato(item.zapato);
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                carrito.agregarZapato(item.zapato);
              },
            ),
          ],
        ),
      ),
    );
  }
}
