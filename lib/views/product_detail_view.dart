import 'package:flutter/material.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcTafhdDoZ2H7WRl7fiDbveq-cWi2W8T6O2g&s', // Reemplaza con la URL de tu imagen
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20), // Espacio entre la imagen y la descripción
            const Text(
              'This is the product description. It provides details about the product, including features, specifications, and benefits.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20), // Espacio entre la descripción y el botón
            ElevatedButton(
              onPressed: () {
                // Acción del botón
              },
              child: const Text('Comprar'),
            ),
          ],
        ),
      ),
    );
  }
}
