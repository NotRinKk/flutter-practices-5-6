import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:practice5_6/NameScreen.dart';
import 'Styles.dart';
//Экран для проверки платформы
class CheckPage extends StatelessWidget {
  final String data;
  final String _imageURL = "https://img.freepik.com/free-vector/hand-drawn-porcupine-cartoon-illustration_23-2151295243.jpg?t=st=1714728831~exp=1714732431~hmac=1cf095b1856a30d876080272c4859fddddd71b5c9683173100b1390bbcdce48b&w=826";
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
        Navigator.pushNamed(context, '/WebScreen');//--------------------------------------------------------/AndroidScreen
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
              CachedNetworkImage(
                imageUrl: _imageURL,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  size: 100,
                  color: Colors.red,
                ),
                imageBuilder: (context, imageProvider) => Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              //Image.asset('assets/images/sad.png'),
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
