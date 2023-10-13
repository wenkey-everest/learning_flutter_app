import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Widget>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Screen"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          args["title"]!,
          args["subtitle"]!,
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("go back"))
        ],
      )),
    );
  }
}
