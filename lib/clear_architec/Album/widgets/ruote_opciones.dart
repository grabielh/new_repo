import 'package:flutter/material.dart';

class RouteOption extends StatelessWidget {
  const RouteOption({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const OptionOne(),
      },
    );
  }
}

class OptionOne extends StatelessWidget {
  const OptionOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
