import 'package:flutter/material.dart';

class DummyAvatar extends StatelessWidget {
  const DummyAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(radius: 40, child: Icon(Icons.person));
  }
}
