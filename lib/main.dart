import 'dart:math';
import 'package:flutter/material.dart';
import 'dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gambary_Party' ,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: const DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int value1 = 1;
  int value2 = 1;


  int get total => value1 + value2;


  bool get isWin => total >= 10;

  void roll() {
    setState(() {
      value1 = Random().nextInt(6) + 1;
      value2 = Random().nextInt(6) + 1;
    });
  }

  void reset() {
    setState(() {
      value1 = 1;
      value2 = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;


    String imagePath = isWin ? 'assets/images/gambareee.jpg' : 'assets/images/sobeettt.jpg';

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.casino),
        title: const Text('2or2os Ya 3m sabeer🥳🥳'),
        centerTitle: true,
        backgroundColor: colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'Total: $total',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),


            Image.asset(
              imagePath,
              height: 200,
            ),
            const SizedBox(height: 10),


            Text(
              isWin ? 'Aywa Keda Ra2asnee🕺🏻' : 'Ya De El3aknana😤',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isWin ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 40),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Dice(value: value1),
                Dice(value: value2),
              ],
            ),
            const SizedBox(height: 40),


            Row(
              children: [
                Expanded(
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: roll,
                    child: const Text('Roll', style: TextStyle(fontSize: 20)),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: reset,
                    child: const Text('Reset', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}