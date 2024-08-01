import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/providers/product_provider.dart';
import '../routes/app_routes.dart';
import 'styles.dart';

class ProductDetailWidget extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: AppStyles.cardMargin,
      child: Padding(
        padding: AppStyles.cardPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                url,
                width: 175,
                height: 175,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppStyles.cardTitleStyle,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: AppStyles.cardSubtitleStyle,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$ $price', // Formato de precio
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    'Stock: $stock', // Formato de precio
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    context.push(
                      Uri(
                        path: AppRoutes.createUpdate,
                        queryParameters: {'productId': id},
                      ).toString(),
                    );
                  },
                  child: const Icon(Icons.edit, color: Colors.white70,),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    showDeleteDialog(context, ref);
                  },
                  child: const Icon(Icons.delete,color: Colors.white70,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showDeleteDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmación'),
          content:
              const Text('¿Estás seguro de que deseas eliminar este producto?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                context.pop();
              },
            ),
            TextButton(
              child: const Text('Eliminar'),
              onPressed: () {
                ref.read(deleteProductProvider(id));
                context.push(AppRoutes.productsListView);
                ref.invalidate(productsProvider);
              },
            ),
          ],
        );
      },
    );
  }
}
