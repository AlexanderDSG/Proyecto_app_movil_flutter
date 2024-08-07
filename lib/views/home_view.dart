import 'package:flutter/material.dart';
import 'package:myapp/widgets/drawer_widget.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  List<Widget> cards = [
    SizedBox(
      width: 500,
      height: 700,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.network(
          'https://blog.puntoaliado.com/hs-fs/hubfs/Blog/Camaro%20SIX%20SS.jpg?width=500&name=Camaro%20SIX%20SS.jpg',
          width: 500,
          height: 500,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Camaro SIX SS',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        )
      ]),
    ),
    SizedBox(
      width: 500,
      height: 700,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.network(
          'https://cdn.drivek.com/configurator-imgs/cars/es/800/FIAT/500/2107_BERLINA-3-PUERTAS/nuova-fiat-500-2016.jpg',
          width: 500,
          height: 500,
        ),
        const SizedBox(
          height: 35,
        ),
        const Text(
          'FIAT 500',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        )
      ]),
    ),
    SizedBox(
      width: 500,
      height: 700,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.network(
          'https://blog.puntoaliado.com/hs-fs/hubfs/Blog/Tahoe.jpg?width=500&name=Tahoe.jpg',
          width: 500,
          height: 500,
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          'Chevrolet Tahoe',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        )
      ]),
    ),
  ];

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          const Text(
            'Lista de Carros Populares',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: CardSwiper(
              cardsCount: cards.length,
              cardBuilder:
                  (context, index, percentThresholdX, percentThresholdY) =>
                      cards[index],
            ),
          ),
        ],
      ),
    );
  }
}
