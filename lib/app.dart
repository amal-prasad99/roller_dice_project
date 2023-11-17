import 'package:flutter/material.dart';
import 'package:roller_dice_01/gradient_container.dart';

class RollerDiceApp extends StatelessWidget {
  const RollerDiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Roller Dice App',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          backgroundColor: Colors.amber.shade300,
        ),
        body: const GraidentContainer(),
      ),
    );
  }
}
