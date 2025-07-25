import 'package:flutter/material.dart';
import 'package:roll_dice_app/dice_roller.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: GradientContainer())));
}

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  static const List<Color> _gradientColors = [
    Colors.blue,
    Colors.purple,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: _gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(child: DiceRoller()),
    );
  }
}
