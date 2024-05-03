import 'package:flutter/material.dart';
import 'AndroidScreen.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Проверка заряда недоступна на данной платформе',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
