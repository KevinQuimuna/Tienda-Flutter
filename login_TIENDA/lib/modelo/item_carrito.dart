import 'zapato.dart';

class ItemCarrito {
  final Zapato zapato;
  int cantidad;

  ItemCarrito({required this.zapato, required this.cantidad});

  double get subtotal => zapato.precio * cantidad;
}
