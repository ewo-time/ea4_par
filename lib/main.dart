import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(top: 5.0),
              child: Text(
                'Dice Game',
                style: TextStyle(
                  fontFamily: 'Sunshiney',
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
          ),
          backgroundColor: Colors.amberAccent,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1, right = 1;
  int totalRolls = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        changeValue();
                      });
                    },
                    child: Image.asset('images/dice$left.png'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        changeValue();
                      });
                    },
                    child: Image.asset('images/dice$right.png'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Text(
            'Dice roll total: $totalRolls',
            style: const TextStyle(
              fontFamily: 'Sunshiney',
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            getDiceComparisonText(),
            style: const TextStyle(
              fontFamily: 'Sunshiney',
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  String getDiceComparisonText() {
    if (left > right) {
      return 'The left dice wins!';
    } else if (right > left) {
      return 'The right dice wins!';
    } else {
      return 'The left and right dice are equal!';
    }
  }

  void changeValue() {
    left = 1 + Random().nextInt(6);
    right = 1 + Random().nextInt(6);
    totalRolls++;
  }
}
