import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/types/product.dart';

import '../providers/product_provider.dart';
import '../widgets/card_item_product.dart';
import '../widgets/drawer_widget.dart';

class ProductsListView extends ConsumerWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productProv = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("List products View"),
      ),
      drawer: const DrawerWidget(),
      body: productProv.when(
        data: (List<Product> lp) {
          return ListView.builder(
            itemCount: lp.length,
            itemBuilder: (context, index) {
              final product = lp[index];
              return CardItemProduct(
                id: product.id,
                url: product.urlImage,
                name: product.name,
                price: product.price,
                stock: product.stock,
                description: product.description,
              );
            },
          );
        },
        error: (obj, err) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(err.toString()),
              const SizedBox(height: 8),
              const Text('===='),
              Text(obj.toString()),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
