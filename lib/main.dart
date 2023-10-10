import 'package:flutter/material.dart';

void main() {
  runApp(const FindEvenOrOdd());
}

class FindEvenOrOdd extends StatefulWidget {
  const FindEvenOrOdd({super.key});

  @override
  State<FindEvenOrOdd> createState() => _FindEvenOrOddState();
}

class _FindEvenOrOddState extends State<FindEvenOrOdd> {
  int _number = 0;

  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                  setState(() {
                    _number = int.parse(textEditingController.text);
                  });
                },
                child: const Text("Check"),
              ),
              Text(
                (_number % 2 == 0) ? "Even" : "Odd",
                style: const TextStyle(fontSize: 22),
              )
            ],
          ),
        ),
      ),
    );
  }
}
