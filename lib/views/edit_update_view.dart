import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_provider.dart';
import '../widgets/edit_input_text.dart';
import '../widgets/drawer_widget.dart';

class EditUpdateView extends ConsumerWidget {
  final String productId;

  const EditUpdateView({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productByIdProvider(productId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      drawer: const DrawerWidget(),
      body: product.when(
        data: (item) {
          return SingleChildScrollView(
            child: Column(
              children: [
                EditInputText(
                  initialValue: item.name,
                  label: 'Name',
                  hintText: 'Name of the product',
                  helperText: 'The name of the product',
                ),
                EditInputText(
                  initialValue: item.description,
                  label: 'Description',
                  hintText: 'Description of the product',
                  helperText: 'The description of the product',
                ),
                EditInputText(
                  initialValue: item.price.toString(),
                  label: 'Price',
                  hintText: 'Price of the product',
                  helperText: 'The price of the product',
                ),
                EditInputText(
                  initialValue: item.stock.toString(),
                  label: 'Stock',
                  hintText: 'Stock of the product',
                  helperText: 'The stock of the product',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      // Lógica para actualizar el producto
                    },
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
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Column(
          children: [
            Text(error.toString()),
            Text(stackTrace.toString()),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
