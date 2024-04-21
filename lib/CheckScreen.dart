import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:practice5_6/NameScreen.dart';

import 'Styles.dart';
//Экран для проверки платформы
class CheckPage extends StatelessWidget {
  final String data;
  const CheckPage({super.key,  required this.data});

  @override
  Widget build(BuildContext context) {
    // Проверяем, соответствует ли выбор пользователя его фактической платформе
    bool isCorrectPlatform = (data == 'Android' && !kIsWeb) ||
        (data == 'Web' && kIsWeb);

    if (isCorrectPlatform) {
      // Если выбор пользователя соответствует его платформе, переходим на соответствующий экран
      if (data == 'Android') {
        // Переход на экран AndroidScreen
          Navigator.pushNamed(context, '/AndroidScreen');
      } else if (data == 'Web') {
        // Переход на экран WebScreen
        Navigator.pushNamed(context, '/WebScreen');
      }
    } else {
      // Если пользователь выбрал неправильную платформу, выводим сообщение об ошибке
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Обманывать плохо :(',
                textAlign: TextAlign.center,
              ),
              Image.asset('assets/images/sad.png'),
              CustomTextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(
                      builder: (BuildContext context) => const NamePage()));
                },
                text: 'Перейти на начальный экран',
              ),
            ],
          ),
        ),
      );
    }
    // По умолчанию возвращаем пустой контейнер
    return Container();
  }
}
