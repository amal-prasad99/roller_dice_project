import 'package:flutter/material.dart';
import 'package:roller_dice_01/app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Roller Dice'),
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(80.0),
                child: Text(
                  'Welcome \n To \nRollerDice',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
              Builder(
                builder: (BuildContext builderContext) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        builderContext,
                        MaterialPageRoute(
                            builder: (context) => RollerDiceApp()),
                      );
                    },
                    child: const Text('New Game'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
