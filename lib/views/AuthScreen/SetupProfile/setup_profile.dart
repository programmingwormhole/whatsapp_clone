import 'package:flutter/material.dart';

class SetupProfile extends StatelessWidget {
  const SetupProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Setup Your Profile'),
      ),
    );
  }
}
