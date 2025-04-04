import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Rock-Paper-Scissors',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, String> choices = {
    'rock': "assets/rock.png",
    'paper': "assets/paper.png",
    'scissor': "assets/scissor.png",
    // "default": "assets/question.png",
  };
  String playerchoice = "assets/question.png";
  String computerchoice = "assets/question.png";

  int yourscore = 0;
  int computerscore = 0;

  void Play(String choice) {
    // Implement game logic here
    setState(() {
      // if (choice == null) throw Exception("Choice cannot be null");
      playerchoice = choices[choice]!;
      String currentchoice = choice;
      String cpuchoice = choices.keys.toList().elementAt(
        Random().nextInt(choices.length),
      );
      computerchoice = choices[cpuchoice]!;

      switch (cpuchoice) {
        case "rock":
          if (currentchoice == "paper") {
            yourscore++;
          } else if (currentchoice == "scissor") {
            computerscore++;
          }
          break;
        case "paper":
          if (currentchoice == "scissor") {
            yourscore++;
          } else if (currentchoice == "rock") {
            computerscore++;
          }
          break;
        case "scissor":
          if (currentchoice == "rock") {
            yourscore++;
          } else if (currentchoice == "paper") {
            computerscore++;
          }
          break;
        default:
          computerscore++;
          yourscore++;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Let\'s Play Rock-Paper-Scissors!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 50),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(playerchoice, width: 20, height: 20),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Computer:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(computerchoice, width: 20, height: 20),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Image.asset('assets/rock.png', width: 40, height: 40),
                onPressed: () {
                  Play("rock");
                },
              ),
              ElevatedButton(
                child: Image.asset('assets/paper.png', width: 40, height: 40),
                onPressed: () {
                  Play("paper");
                },
              ),
              ElevatedButton(
                child: Image.asset('assets/scissor.png', width: 40, height: 40),
                onPressed: () {
                  Play("scissor");
                },
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Your Score: ${yourscore}",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              Text(
                "Computer Score: ${computerscore}",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Image.asset('assets/refresh.png', width: 30, height: 30),
            onPressed: () {
              setState(() {
                computerscore = 0;
                yourscore = 0;
              });
            },
          ),
          Text(
            "Reset Score",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
