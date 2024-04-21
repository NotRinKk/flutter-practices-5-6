import 'package:flutter/material.dart';
import 'NameScreen.dart';
import 'PlatformScreen.dart';
import 'CheckScreen.dart';
import 'AndroidScreen.dart';
import 'WebScreen.dart';
import 'GreetingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: { // Использование маршрутов для навигации
        '/home':(context) => NamePage(),
        '/PlatformPage':(context) => PlatformPage(),
        '/CheckPage': (context) => CheckPage(data: ModalRoute.of(context)?.settings.arguments as String), // Получение аргумента и передача его в CheckPage
        '/AndroidScreen':(context) => AndroidScreen(),
        '/WebScreen':( context) => WebScreen(),
        '/GreetingPage':( context) => GreetingPage(data: ModalRoute.of(context)?.settings.arguments as String),
      },
      title: 'Практики',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NamePage()
    );
  }
}

