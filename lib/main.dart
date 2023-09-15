import 'package:consumo_api/widgets/homescrens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ConsumoAPI());
}

class ConsumoAPI extends StatefulWidget {
  const ConsumoAPI({super.key});

  @override
  State<ConsumoAPI> createState() => _ConsumoAPIState();
}

class _ConsumoAPIState extends State<ConsumoAPI> {
  bool isDart = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Consumo de API',
      theme: isDart
          ? ThemeData(colorScheme: const ColorScheme.dark())
          : ThemeData(colorScheme: const ColorScheme.light()),
      home: const HomeScrens(),
    );
  }
}
