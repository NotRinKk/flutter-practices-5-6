import 'package:flutter/material.dart';
import 'NameScreen.dart';
import 'PlatformScreen.dart';
import 'CheckScreen.dart';
import 'AndroidScreen.dart';
import 'WebScreen.dart';
import 'GreetingScreen.dart';
void main() {
  // Выполняет настройку зависимостей с помощью setupLocator(),
  setupLocator();// Регистрация зависимостей с помощью setupLocator()
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: { // Использование маршрутов для навигации
        '/home':(context) => const NamePage(),
        '/PlatformPage':(context) => const PlatformPage(),
        '/CheckPage':
            (context) => CheckPage(data: ModalRoute.of(context)?.settings.arguments as String),
        // Получение аргумента и передача его в CheckPage
        '/AndroidScreen':(context) => AndroidScreen(),
        '/WebScreen':( context) => const WebScreen(),
        '/GreetingPage':( context) => GreetingPage(), //Использование Inhereted Widget для передачи данных
      },
      title: 'Практики',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const NamePage()
    );
  }
}

