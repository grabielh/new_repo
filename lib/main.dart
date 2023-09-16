import 'package:consumo_api/widgets/homescrens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ConsumoAPI());
}

class ConsumoAPI extends StatelessWidget {
  const ConsumoAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Consumo de API',
      theme:ThemeData(colorScheme: const ColorScheme.dark()),
      home: const HomeScrens(),
    );
  }
}
