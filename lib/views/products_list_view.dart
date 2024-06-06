import 'package:flutter/material.dart';
import '../widgets/card_item_product.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products List'),
      ),
      body: ListView(
        children: const [
          CardItemProduct(
            name: 'Product 1',
            price: '\$50',
            quantity: '10',
            description:
                'This is a product description. This paragraph provides details about the product, highlighting its features and benefits.',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcTafhdDoZ2H7WRl7fiDbveq-cWi2W8T6O2g&s',
          ),
          CardItemProduct(
            name: 'Product 2',
            price: '\$30',
            quantity: '5',
            description:
                'This is another product description. It provides details about the second product.',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcTafhdDoZ2H7WRl7fiDbveq-cWi2W8T6O2g&s',
          ),
          CardItemProduct(
            name: 'Product 3',
            price: '\$20',
            quantity: '8',
            description:
                'This is the third product description. It describes the third product in detail.',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcTafhdDoZ2H7WRl7fiDbveq-cWi2W8T6O2g&s',
          ),
        ],
      ),
    );
  }
}
