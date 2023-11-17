import 'package:flutter/material.dart';
import 'package:roller_dice_01/gradient_container.dart';

class RollerDiceApp extends StatelessWidget {
  const RollerDiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Roller Dice App'),
          backgroundColor: Colors.amber.shade300,
        ),
        body: const GraidentContainer(colors: [
          Color.fromARGB(255, 9, 82, 141),
          Color.fromARGB(255, 149, 3, 171)
        ]),
      ),
    );
  }
}
