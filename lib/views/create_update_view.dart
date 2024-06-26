import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../routes/app_routes.dart';
import '../widgets/create_input_text.dart';
import '../widgets/drawer_widget.dart';
import 'package:go_router/go_router.dart';

class CreateUpdateView extends StatelessWidget {
  CreateUpdateView({super.key});

  // Controladores para los campos de entrada
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController urlImageController = TextEditingController();

  // Función para crear un nuevo producto
  Future<void> createProduct(BuildContext context) async {
    final dio = Dio();

    final product = {
      "name": nameController.text,
      "description": descriptionController.text,
      "price": double.tryParse(priceController.text) ?? 0.0,
      "stock": double.tryParse(stockController.text) ?? 0.0,
      "urlImage": urlImageController.text,
    };

    // Imprimir datos del producto para depuración
    print("Datos del producto a enviar: $product");

    try {
      final response = await dio.post(
        "https://pucei.edu.ec:9101/api/v2/products",
        data: product,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Redirigir a la pantalla de inicio después de la creación exitosa
        context.go(AppRoutes.home);
      } else {
        // Maneja el error de acuerdo a tu lógica
        print("Error al crear el producto: ${response.statusMessage}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al crear el producto: ${response.statusMessage}')),
        );
      }
    } catch (e) {
      // Maneja cualquier error de la solicitud
      if (e is DioError) {
        print("Error de Dio: ${e.response?.statusCode} - ${e.response?.data}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al crear el producto: ${e.response?.data}')),
        );
      } else {
        print("Excepción al crear el producto: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Excepción al crear el producto: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Product'),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreateInputText(
              controller: nameController,
              label: 'Name',
              hintText: 'Enter the name of the product',
              helperText: 'The name of the product',
            ),
            CreateInputText(
              controller: descriptionController,
              label: 'Description',
              hintText: 'Enter the description of the product',
              helperText: 'The description of the product',
            ),
            CreateInputText(
              controller: priceController,
              label: 'Price',
              hintText: 'Enter the price of the product',
              helperText: 'The price of the product',
            ),
            CreateInputText(
              controller: stockController,
              label: 'Stock',
              hintText: 'Enter the stock of the product',
              helperText: 'The stock of the product',
            ),
            CreateInputText(
              controller: urlImageController,
              label: 'Image URL',
              hintText: 'Enter the URL of the product image',
              helperText: 'The URL of the product image',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  createProduct(context);
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Crear",
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
      ),
    );
  }
}
