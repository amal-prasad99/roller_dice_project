import 'package:flutter/material.dart';
import 'package:roller_dice_01/roller_dice.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GraidentContainer extends StatelessWidget {
  const GraidentContainer({super.key, required this.colors});
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: beginAlignment, end: endAlignment, colors: colors),
      ),
      child: const Center(
        child: RollerDice(),
      ),
    );
  }
}
