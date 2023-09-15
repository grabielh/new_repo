// ignore_for_file: must_be_immutable

import 'package:consumo_api/widgets/lista_album.dart';
import 'package:consumo_api/widgets/ruote_opciones.dart';
import 'package:flutter/material.dart';

class HomeScrens extends StatefulWidget {
  const HomeScrens({super.key});

  @override
  State<HomeScrens> createState() => _HomeScrensState();
}

class _HomeScrensState extends State<HomeScrens> {
  int index = 0;
  List<Widget> screenPage = const [ListarAlbum(), RouteOption()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenPage[index],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_filled), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.route), label: 'Route')
        ],
        onDestinationSelected: (index) {
          setState(
            () {
              this.index = index;
            },
          );
        },
        selectedIndex: index,
      ),
    );
  }
}
