import 'package:flutter/material.dart';
import '../modelo/zapato.dart';
import '../rutas/app_rutas.dart';
import '../widgets_items/zapato_widget.dart';

class PantallaCategoriaZapatos extends StatelessWidget {
  final List<Zapato> zapatos = [
    Zapato(
      id: '1',
      nombre: 'Deportivo Nike',
      precio: 120.0,
      imagen: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP-hvjMTbtephYQURIYL8LjrKWV7Y-rmNZJg&s',
      categoria: 'Deportivo',
    ),
    Zapato(
      id: '2',
      nombre: 'Formal Gucci',
      precio: 300.0,
      imagen: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3qhNhUNVxmtYvo4tlHvKFVXLHrf0WkBYZVQ&s',
      categoria: 'Formal',
    ),
    Zapato(
      id: '3',
      nombre: 'Casual Adidas',
      precio: 90.0,
      imagen: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXJmQzI0Dohe2RX0_9WYK4or49Jlo9ejx33A&s',
      categoria: 'Casual',
    ),
    Zapato(
      id: '4',
      nombre: 'Elegante Prada',
      precio: 250.0,
      imagen: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ38aOMqoYpFiZP9XaiY_eSnrRB7XWnkst-jw&s',
      categoria: 'Formal',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.logout, color: Colors.white, size: 24),
          onPressed: () {
            // Cierra sesión y navega a la pantalla de login
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        title: const Text(
          'Categorías de Zapatos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/carrito');
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Fondo decorativo
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Colors.pinkAccent, Colors.deepPurpleAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  // Ícono del carrito
                  const Icon(
                    Icons.shopping_cart,
                    size: 24,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Botón para ir a la página principal
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/pantallaBienvenida');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text(
              'Ir a la Página Principal',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          // Mostrar las categorías de zapatos
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Dos tarjetas por fila
                childAspectRatio: 0.8, // Proporción ajustada para un diseño más visual
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: zapatos.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          zapatos[index].categoria,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      Expanded(child: ZapatoWidget(zapato: zapatos[index])),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}
