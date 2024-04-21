import 'package:flutter/material.dart';

import 'Styles.dart';

//Экран выбора платформы
class PlatformPage extends StatefulWidget {
  @override
  _PlatformPageState createState() => _PlatformPageState();
  const PlatformPage({super.key});
}

class _PlatformPageState extends State<PlatformPage> {
  String selectedPlatform = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбор платформы'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Укажите на какой вы платформе',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Список доступных платформ',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPlatform = 'Android';
                });
              },
              child: const Text(
                'Android',
                textAlign: TextAlign.left,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPlatform = 'Web';
                });
              },
              child: const Text(
                'Web',
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Выбранная платформа: $selectedPlatform',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0), // Отступ между кнопками
          child: CustomTextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/CheckPage', arguments: selectedPlatform);
                }, text: 'Далее',
            ),
          ),
            CustomTextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/GreetingPage');
                }, text: 'Назад',
            ),
          ],
        ),
      ),
    );
  }
}
