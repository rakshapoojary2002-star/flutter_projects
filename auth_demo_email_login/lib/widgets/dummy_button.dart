import 'package:flutter/material.dart';

class DummyButton extends StatelessWidget {
  const DummyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('I am a Dummy Button'),
    );
  }
}
