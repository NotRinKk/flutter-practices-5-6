import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'Styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Создаем провайдер для управления выбранной платформой
final selectedPlatformProvider = StateProvider<String>((ref) => '');

class PlatformPage extends ConsumerWidget {
  const PlatformPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPlatform = ref.watch(selectedPlatformProvider.notifier).state;
    final String _imageURL =
        "https://img.freepik.com/free-vector/responsive-concept-illustration_114360-674.jpg?t=st=1714728969~exp=1714732569~hmac=1ba2cafef7b5c5916cf915fef2fecc548d69bcbd552c5d20fa4c3077bd482004&w=1380";

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
                ref.read(selectedPlatformProvider.notifier).state = 'Android';
              },
              child: const Text(
                'Android',
                textAlign: TextAlign.left,
              ),
            ),
            GestureDetector(
              onTap: () {
                ref.read(selectedPlatformProvider.notifier).state = 'Web';
              },
              child: const Text(
                'Web',
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Выбранная платформа: ${ref.watch(selectedPlatformProvider)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: CustomTextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/CheckPage',
                      arguments: selectedPlatform);
                },
                text: 'Далее',
              ),
            ),
            CustomTextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/GreetingPage');
              },
              text: 'Назад',
            ),
          ],
        ),
      ),
    );
  }
}