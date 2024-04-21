// Импорт основных библиотек и пользовательских файлов.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'NameScreen.dart';
import 'Styles.dart';
class AndroidScreen extends StatefulWidget {
  @override
  _AndroidScreenState createState() => _AndroidScreenState(); // Создание состояния для AndroidScreen.
}
class _AndroidScreenState extends State<AndroidScreen> {
  // Создание платформенного канала для взаимодействия с методами платформы.
  static const platform = MethodChannel('samples.flutter.dev/battery');
  // Инициализация переменной для хранения уровня заряда батареи.
  String _batteryLevel = 'Неизвестный уровень батреи.';
  // Асинхронная функция для получения уровня заряда батареи.
  Future<void> _getBatteryLevel() async {
    String batteryLevel; // Переменная для хранения уровня заряда батареи.
    try {
      // Вызов метода платформы для получения уровня заряда батареи.
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .'; // Формирование строки с уровнем заряда.
    } on PlatformException catch (e) {
      // Обработка исключений, возникающих при вызове метода платформы.
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    // Обновление состояния виджета для отображения полученного уровня заряда батареи.
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Level'), // Установка заголовка AppBar.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Кнопка для проверки уровня батареи.
            CustomTextButton(
              onPressed: _getBatteryLevel, // Обработчик нажатия кнопки для вызова функции _getBatteryLevel.
              text: 'Проверить уровень батареи',
            ),
            Text(_batteryLevel), // Отображение текущего уровня заряда батареи.
            // Кнопка для перехода на начальный экран.
            CustomTextButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => NamePage()));
              },
              text: 'Перейти на начальный экран',
            ),
          ],
        ),
      ),
    );
  }
}
