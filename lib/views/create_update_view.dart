import 'package:flutter/material.dart';
import '../widgets/create_input_text.dart';
import '../widgets/drawer_widget.dart';

class CreateUpdateView extends StatelessWidget {

  const CreateUpdateView({super.key});

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
            const CreateInputText(
              initialValue: '', // Asigna aquí el valor inicial según tu lógica
              label: 'Name',
              hintText: 'Enter the name of the product',
              helperText: 'The name of the product',
            ),
            const CreateInputText(
              initialValue: '',
              label: 'Description',
              hintText: 'Enter the description of the product',
              helperText: 'The description of the product',
            ),
            const CreateInputText(
              
              initialValue: '', // Asigna aquí el valor inicial según tu lógica
              label: 'Price',
              hintText: 'Enter the price of the product',
              helperText: 'The price of the product',
            ),
            const CreateInputText(
              initialValue: '', // Asigna aquí el valor inicial según tu lógica
              label: 'Stock',
              hintText: 'Enter the stock of the product',
              helperText: 'The stock of the product',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  // Lógica para crear o actualizar el producto
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
