import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logica/carrito_logica.dart';
import '../logica/factura_logica.dart';

class PantallaFactura extends StatelessWidget {
  const PantallaFactura({super.key});

  @override
  Widget build(BuildContext context) {
    final carrito = Provider.of<CarritoLogica>(context);
    final facturaLogica = FacturaLogica();

    return Scaffold(
      appBar: AppBar(title: const Text('Factura')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Factura', style: TextStyle(fontSize: 24)),
            const Divider(),
            ...carrito.items.map(
                  (item) => Text(
                '${item.zapato.nombre} x${item.cantidad} - \$${item.subtotal.toStringAsFixed(2)}',
              ),
            ),
            const Divider(),
            Text(
              'Total: \$${carrito.total.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () async {
          await facturaLogica.generarPDF(carrito.items, carrito.total);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Factura generada')),
          );
        },
        child: const Text('Descargar PDF'),
      ),
    );
  }
}