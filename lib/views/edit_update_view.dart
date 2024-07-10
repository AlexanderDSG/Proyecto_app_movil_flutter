import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/product_provider.dart';
import '../routes/app_routes.dart';
import '../types/product.dart';
import '../widgets/edit_input_text.dart';
import '../widgets/drawer_widget.dart';

class EditUpdateView extends ConsumerStatefulWidget {
  final String productId;

  const EditUpdateView({Key? key, required this.productId}) : super(key: key);

  @override
  _EditUpdateViewState createState() => _EditUpdateViewState();
}

class _EditUpdateViewState extends ConsumerState<EditUpdateView> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  late TextEditingController stockController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
    stockController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    stockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productByIdProvider(widget.productId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      drawer: const DrawerWidget(),
      body: product.when(
        data: (item) {
          nameController.text = item.name;
          descriptionController.text = item.description;
          priceController.text = item.price.toString();
          stockController.text = item.stock.toString();

          return SingleChildScrollView(
            child: Column(
              children: [
                EditInputText(
                  controller: nameController,
                  label: 'Name',
                  hintText: 'Name of the product',
                  helperText: 'The name of the product',
                ),
                EditInputText(
                  controller: descriptionController,
                  label: 'Description',
                  hintText: 'Description of the product',
                  helperText: 'The description of the product',
                ),
                EditInputText(
                  controller: priceController,
                  label: 'Price',
                  hintText: 'Price of the product',
                  helperText: 'The price of the product',
                ),
                EditInputText(
                  controller: stockController,
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
                    onPressed: () async {
                      // Lógica para actualizar el producto
                      final updatedProduct = Product(
                        id: item.id,
                        name: nameController.text,
                        description: descriptionController.text,
                        price: double.parse(priceController.text),
                        stock: double.parse(stockController.text),
                        urlImage: item.urlImage,
                        v: item.v,
                      );

                      final success = await ref.read(productUpdateProvider.notifier).updateProduct(updatedProduct);

                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Product updated successfully!'),
                        ));
                        // Navegar a ProductsListView después de la actualización exitosa
                        context.go(AppRoutes.productListView);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Failed to update product.'),
                        ));
                      }
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
