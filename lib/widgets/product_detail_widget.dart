import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/routes/app_routes.dart';

import '../providers/product_provider.dart';

class ProductDetailWidget extends StatelessWidget {
  final String id;
  final String url;
  final String name;
  final double price;
  final double stock;
  final String description;

  const ProductDetailWidget({
    super.key,
    required this.id,
    required this.url,
    required this.name,
    required this.price,
    required this.stock,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final deleteProduct = ref.read(productDeleteProvider.notifier);

      return Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        url,
                        width: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 125,
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 125,
                            child: Text(
                              description,
                              style: const TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          Text(
                            '\$ $price', 
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            'Stock: $stock', 
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                  ),
                  onPressed: () => context.push('${AppRoutes.editUpdate}/$id'),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Actualizar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red),
                  ),
                  onPressed: () async {
                    final success = await deleteProduct.deleteProduct(id);
                    if (success) {
                      // Manejar la eliminación exitosa, por ejemplo, navegar a otra pantalla
                      context.go(AppRoutes.productListView);
                    } else {
                      // Manejar la eliminación fallida, mostrar mensaje de error, etc.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Failed to delete product'),
                        ),
                      );
                    }
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Eliminar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      );
    });
  }
}
