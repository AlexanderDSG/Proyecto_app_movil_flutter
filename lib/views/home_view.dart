import 'package:flutter/material.dart';
import 'package:myapp/widgets/drawer_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const DrawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://st4.depositphotos.com/1010735/21836/v/450/depositphotos_218363620-stock-illustration-autumn-welcome-sign-colorful-maple.jpg',
              width: 200,
              height: 200,
            ),
            const Text('WELCOME'),
          ],
        ),
      ),
    );
  }
}
