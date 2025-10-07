import 'package:flutter/material.dart';

class DummyCard extends StatelessWidget {
  const DummyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('I am a Dummy Card'),
      ),
    );
  }
}
