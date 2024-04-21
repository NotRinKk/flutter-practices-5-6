import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'NameScreen.dart';
import 'Styles.dart';

class AndroidScreen extends StatefulWidget {
  @override
  _AndroidScreenState createState() => _AndroidScreenState();
}

class _AndroidScreenState extends State<AndroidScreen> {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  String _batteryLevel = 'Неизвестный уровень батреи.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Level'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextButton(
              onPressed: _getBatteryLevel,
              text: 'Проверить уровень батареи',
            ),
            Text(_batteryLevel),
            CustomTextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => NamePage()));
              },
              text: 'Перейти на начальный экран',
            ),
          ],
        ),
      ),
    );
  }
}
