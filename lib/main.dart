import 'package:flutter/material.dart';
import 'NameScreen.dart';
import 'PlatformScreen.dart';
import 'CheckScreen.dart';
import 'AndroidScreen.dart';
import 'WebScreen.dart';
import 'GreetingScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() {
  //Начальная точка управления состоянием Riverpod
  runApp(const ProviderScope(child: MyApp()));
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

