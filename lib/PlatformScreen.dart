import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';// Импортируем пакет GetIt для управления зависимостями
import 'Styles.dart';

// Создаём переменную locator как экземпляр GetIt для доступа к зависимостям
GetIt locator = GetIt.instance;

// Функция настройки зависимостей
void setupLocator() {
  // Регистрируем зависимость PlatformService в GetIt.
  // registerLazySingleton обеспечивает создание и хранение
  // только одного экземпляра PlatformService при первом запросе
  locator.registerLazySingleton<PlatformService>(() => PlatformService());
}

// Сервис для работы с платформой
class PlatformService {
  // Переменная для хранения выбранной платформы
  String selectedPlatform = '';
}

//Экран выбора платформы
class PlatformPage extends StatefulWidget {
  @override
  _PlatformPageState createState() => _PlatformPageState();
  const PlatformPage({super.key});
}
class _PlatformPageState extends State<PlatformPage> {
  String selectedPlatform = '';
  final String _imageURL = "https://img.freepik.com/free-vector/responsive-concept-illustration_114360-674.jpg?t=st=1714728969~exp=1714732569~hmac=1ba2cafef7b5c5916cf915fef2fecc548d69bcbd552c5d20fa4c3077bd482004&w=1380";
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
                // Обновляем выбранную платформу в PlatformService
                locator<PlatformService>().selectedPlatform = 'Android';
                setState(() {});
              },
              child: const Text(
                'Android',
                textAlign: TextAlign.left,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Обновляем выбранную платформу в PlatformService
                locator<PlatformService>().selectedPlatform = 'Web';
                setState(() {});
              },
              child: const Text(
                'Web',
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              // Отображаем выбранную платформу
              'Выбранная платформа: ${locator<PlatformService>().selectedPlatform}',
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
