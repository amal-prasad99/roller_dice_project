import 'package:flutter/material.dart';
import 'package:roller_dice_01/roller_dice.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GraidentContainer extends StatelessWidget {
  const GraidentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/back.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: RollerDice(),
      ),
    );
  }
}
