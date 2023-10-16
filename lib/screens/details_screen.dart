import 'package:flutter/material.dart';
import 'package:learning_flutter_app/providers/counter_provider.dart';
import 'package:learning_flutter_app/services/notification_service.dart';
import 'package:provider/provider.dart';

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
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Provider.of<CounterProvider>(context, listen: false)
                          .increment();
                      NotificationService().showNotification(
                          title: "Added",
                          body: "${context.read<CounterProvider>().number}");
                    },
                    child: const Icon(Icons.add)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "${Provider.of<CounterProvider>(context, listen: true).number}",
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<CounterProvider>(context, listen: false)
                          .decrement();
                    },
                    child: const Icon(Icons.remove))
              ],
            ),
          ),
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
