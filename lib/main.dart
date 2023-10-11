import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int _number = 0;
  String status = "Even";

  final textEditingController = TextEditingController();

  void checkEvenOrOdd(String value) {
    setState(() {
      try {
        _number = int.parse(value);
        status = setResult();
      } on FormatException catch (_) {
        throw const FormatException(
            "You have entered other than integer string");
      }
    });
  }

  String setResult() => (_number % 2 == 0) ? "Even" : "Odd";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: findEvenOrOdd(textEditingController, checkEvenOrOdd, status));
  }
}

Widget findEvenOrOdd(TextEditingController textEditingController,
    Function checkEvenOrOdd, String status) {
  return Scaffold(
    appBar: AppBar(title: const Text("Find Even or Odd")),
    body: Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          ElevatedButton(
            key: const Key("check-button"),
            onPressed: () {
              checkEvenOrOdd(textEditingController.text.isEmpty
                  ? "2"
                  : textEditingController.text);
            },
            child: const Text("Check"),
          ),
          Text(
            status,
            style: const TextStyle(fontSize: 22),
          ),
        ],
      ),
    ),
  );
}
