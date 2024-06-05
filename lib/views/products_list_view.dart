import 'package:flutter/material.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'This is a product description. This paragraph provides details about the product, highlighting its features and benefits.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 10), // Espacio entre el texto y la imagen
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcTafhdDoZ2H7WRl7fiDbveq-cWi2W8T6O2g&s', // Reemplaza con la URL de tu imagen
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
