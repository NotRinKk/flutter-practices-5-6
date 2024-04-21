import 'package:flutter/material.dart';
class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomTextButton({
    required this.onPressed,
    required this.text,  super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        // Устанавливаем стиль для кнопки
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Цвет текста кнопки
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Цвет фона кнопки
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Отступы вокруг текста кнопки
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Радиус закругления углов кнопки
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16), // Стиль текста кнопки
      ),
    );
  }
}