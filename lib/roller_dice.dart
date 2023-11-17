import 'dart:math';

import 'package:flutter/material.dart';

class RollerDice extends StatefulWidget {
  const RollerDice({super.key});

  @override
  State<RollerDice> createState() => _RollerDiceState();
}

class _RollerDiceState extends State<RollerDice> {
  var roleDiceNum = 1;

  var totalP1 = 0;
  var countP1 = 0;
  var totalP2 = 0;
  var countP2 = 0;

  bool isPlayerOneButtonDisabled = false;
  bool isPlayerTwoButtonDisabled = true;

  void rollP1() {
    setState(() {
      roleDiceNum = Random().nextInt(6) + 1;
      totalP1 = totalP1 + roleDiceNum;
      countP1++;

      isPlayerOneButtonDisabled = true;
      isPlayerTwoButtonDisabled = false;
    });
  }

  void rollP2() {
    setState(() {
      roleDiceNum = Random().nextInt(6) + 1;
      totalP2 = totalP2 + roleDiceNum;
      countP2++;

      isPlayerOneButtonDisabled = false;
      isPlayerTwoButtonDisabled = true;

      if (countP2 == 5) {
        gameResult();
      }
    });
  }

  void gameResult() {
    String winnerMsg;

    if (totalP1 > totalP2) {
      winnerMsg = 'Player One Wins';
    } else if (totalP2 > totalP1) {
      winnerMsg = 'Player Two Wins';
    } else {
      winnerMsg = 'Both Lose...';
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Game Over'),
            content: Text(winnerMsg),
            actions: [],
          );
        });

    totalP1 = 0;
    countP1 = 0;
    totalP2 = 0;
    countP2 = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$roleDiceNum.png',
          width: 200,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: isPlayerOneButtonDisabled ? null : rollP1,
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 220, 3, 177),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  )),
              child: const Text('Player One'),
            ),
            TextButton(
              onPressed: isPlayerTwoButtonDisabled ? null : rollP2,
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 220, 3, 177),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  )),
              child: const Text('Player Two'),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Center(
                child: Text(
                  '0',
                  style: TextStyle(
                    color: Colors.amber.shade600,
                    fontSize: 55,
                  ),
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Center(
                child: Text(
                  '0',
                  style: TextStyle(
                    color: Colors.amber.shade600,
                    fontSize: 55,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
