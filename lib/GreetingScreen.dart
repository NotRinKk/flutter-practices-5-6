import 'package:flutter/material.dart';
import 'PlatformScreen.dart';
import 'Styles.dart';
//Экран приветствия
class GreetingPage extends StatelessWidget {
  final String data; // Переменная хранения передаваемых данных на страницу
  const GreetingPage({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Приветствие'),
      ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Привет, $data',// Используем переменную data
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                ),
              ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0), // Отступ между кнопками
                child: CustomTextButton(
                onPressed: () {
                  Navigator.pop(context);//Возврат на предыдущий экран
                  }, text: 'Назад',
                ),
            ),
              CustomTextButton(
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlatformPage()));
                  }, text: 'Далее',
              ),
            ]
          )
        )
      );
  }
}