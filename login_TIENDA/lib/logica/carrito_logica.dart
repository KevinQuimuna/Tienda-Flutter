import 'package:flutter/foundation.dart';
import '../modelo/item_carrito.dart';
import '../modelo/zapato.dart';

class CarritoLogica with ChangeNotifier {
  final List<ItemCarrito> _items = [];

  // Getter para obtener los ítems del carrito
  List<ItemCarrito> get items => _items;

  // Getter para obtener el total del carrito
  double get total => _items.fold(0, (sum, item) => sum + item.subtotal);

  // Agregar un zapato al carrito
  void agregarZapato(Zapato zapato) {
    // Busca el ítem existente en el carrito
    final itemExistente = _items.firstWhere(
          (item) => item.zapato.id == zapato.id,
      orElse: () => ItemCarrito(zapato: zapato, cantidad: 0),
    );

    if (itemExistente.cantidad == 0) {
      _items.add(itemExistente); // Agregar nuevo ítem si no existe
    }

    // Incrementar la cantidad
    itemExistente.cantidad++;
    notifyListeners();
  }

  // Eliminar un zapato del carrito
  void eliminarZapato(Zapato zapato) {
    final index = _items.indexWhere((item) => item.zapato.id == zapato.id);
    if (index != -1) {
      _items[index].cantidad--;
      if (_items[index].cantidad <= 0) {
        _items.removeAt(index); // Eliminar el ítem si la cantidad es 0
      }
      notifyListeners();
    }
  }

  // Vaciar el carrito completamente
  void limpiarCarrito() {
    _items.clear();
    notifyListeners();
  }
}
