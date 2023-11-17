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
  var difference = 0;
  var p1tot = 0;
  var p2tot = 0;

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
      p1tot = totalP1;
      p2tot = totalP2;
      difference = totalP1 - totalP2;
      winnerMsg = 'Player One Wins by $difference points.';
    } else if (totalP2 > totalP1) {
      p2tot = totalP2;
      p1tot = totalP1;
      difference = totalP2 - totalP1;
      winnerMsg = 'Player Two Wins $difference points.';
    } else {
      p2tot = totalP2;
      p1tot = totalP1;
      winnerMsg = 'Both Lose...!';
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Game Over',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    winnerMsg,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Player One Total: $p1tot'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Player Two Total: $p2tot')
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Try Again'),
              ),
            ],
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
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: isPlayerOneButtonDisabled ? null : rollP1,
              style: TextButton.styleFrom(
                  backgroundColor: Colors.amber.shade600,
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  textStyle: const TextStyle(
                    fontSize: 20,
                  )),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  'Player One',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            TextButton(
              onPressed: isPlayerTwoButtonDisabled ? null : rollP2,
              style: TextButton.styleFrom(
                  backgroundColor: Colors.amber.shade600,
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  textStyle: const TextStyle(
                    fontSize: 20,
                  )),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  'Player Two',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 21, 21, 21)),
              width: 100,
              height: 100,
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Round',
                        style: TextStyle(
                          color: Colors.amber.shade600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      '$countP1',
                      style: TextStyle(
                        color: Colors.amber.shade600,
                        fontSize: 55,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 21, 21, 21),
              ),
              width: 100,
              height: 100,
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Round',
                        style: TextStyle(
                          color: Colors.amber.shade600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      '$countP2',
                      style: TextStyle(
                        color: Colors.amber.shade600,
                        fontSize: 55,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 21, 21, 21),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Total',
                      style: TextStyle(
                        color: Colors.amber.shade600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    '$totalP1',
                    style: TextStyle(
                      color: Colors.amber.shade600,
                      fontSize: 55,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 21, 21, 21),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Total',
                      style: TextStyle(
                        color: Colors.amber.shade600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    '$totalP2',
                    style: TextStyle(
                      color: Colors.amber.shade600,
                      fontSize: 55,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
