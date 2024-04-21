import 'package:flutter/material.dart';
import 'GreetingScreen.dart';
import 'Styles.dart';

//Экран для ввода имени
class NamePage extends StatelessWidget {
  const NamePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(); // Создаем контроллер для текстового поля
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Имя'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Введите ваше имя:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: nameController, // Привязываем контроллер к текстовому полю
              decoration: const InputDecoration(
                hintText: 'Ваше имя',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Отступы для кнопки
          child: CustomTextButton(
              onPressed: () {
                String name = nameController.text; // Получаем значение из текстового поля
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GreetingPage(data: name)),
                );
              }, text: 'Далее',
            ),
            )
          ],
        ),
      ),
    );
  }
}
