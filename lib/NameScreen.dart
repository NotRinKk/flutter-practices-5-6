import 'package:flutter/material.dart';
import 'GreetingScreen.dart';
import 'Styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserData extends InheritedWidget {
  final String name;

  const UserData({Key? key, required this.name, required Widget child})
      : super(key: key, child: child);

  static UserData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserData>();
  }

  @override
  bool updateShouldNotify(UserData oldWidget) {
    return name != oldWidget.name;
  }
}

class NamePage extends StatelessWidget {
  const NamePage({Key? key}) : super(key: key);

  final _imageURL =
      "https://img.freepik.com/free-vector/hello-concept-illustration_114360-540.jpg?w=826&t=st=1714726811~exp=1714727411~hmac=2bb9a86d2033d27da338f2e85b7507900c39aa446a0ff0fe868c8d1d939aabbd";

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
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
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Ваше имя',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomTextButton(
                onPressed: () {
                  String name = nameController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserData(
                        name: name,
                        child: GreetingPage(),
                      ),
                    ),
                  );
                },
                text: 'Далее',
              ),
            ),
            CachedNetworkImage(
              imageUrl: _imageURL,
              placeholder: (context, url) =>
              const CircularProgressIndicator(),
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
          ],
        ),
      ),
    );
  }
}
