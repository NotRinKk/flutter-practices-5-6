import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'PlatformScreen.dart';
import 'Styles.dart';
//Экран приветствия
class GreetingPage extends StatelessWidget {
  final String data; // Переменная хранения передаваемых данных на страницу
  const GreetingPage({super.key, required this.data});
  final String _imageURL = "https://img.freepik.com/free-vector/illustration-people-waving-hand_23-2148360309.jpg?t=st=1714727718~exp=1714731318~hmac=fd5aa7ae749519a3fadc5909a3400ff461711d88b234fe63bdf238a4912192c2&w=1380";
  final String _imageURL2 = "https://img.freepik.com/free-vector/hey-lettering-design-illustration_23-2149543967.jpg?t=st=1714729135~exp=1714732735~hmac=1d6fd942c0d8a2618a92c0471d481a5c4976a2e2fcc12121ba93f59df4312a89&w=826";
  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  //       title: const Text('Приветствие'),
  //     ),
  //       body: Padding(
  //         padding: const EdgeInsets.all(20.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Text(
  //               'Привет, $data',// Используем переменную data
  //             style: const TextStyle(
  //               fontSize: 18.0,
  //               fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             CachedNetworkImage(
  //               imageUrl: _imageURL,
  //               placeholder: (context, url) => const CircularProgressIndicator(),
  //               errorWidget: (context, url, error) => const Icon(
  //                 Icons.error,
  //                 size: 100,
  //                 color: Colors.red,
  //               ),
  //               imageBuilder: (context, imageProvider) => Container(
  //                 width: 250,
  //                 height: 250,
  //                 decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                     image: imageProvider,
  //                     fit: BoxFit.fill,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 10.0), // Отступ между кнопками
  //               child: CustomTextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);//Возврат на предыдущий экран
  //                 }, text: 'Назад',
  //               ),
  //           ),
  //             CustomTextButton(
  //                 onPressed: () {
  //                   Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => PlatformPage()));
  //                 }, text: 'Далее',
  //             ),
  //           ),
  //           ]
  //         )
  //       )
  //     );
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Приветствие'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Привет, $data', // Используем переменную data
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: _imageURL2,
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
              ),
            ),
            Expanded(
              child: Center(
                child: CachedNetworkImage(
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
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // Располагаем кнопки по центру
              children: [
                CustomTextButton(
                  onPressed: () {
                    Navigator.pop(context); // Возврат на предыдущий экран
                  },
                  text: 'Назад',
                ),
                CustomTextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PlatformPage()));
                  },
                  text: 'Далее',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}