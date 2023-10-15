import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_flutter_app/presentation/providers/counter_provider.dart';
import 'package:learning_flutter_app/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({required this.extra, super.key});

  final Map<String, Widget> extra;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Screen"),
      ),
      body: Consumer<CounterProvider>(
        builder: (BuildContext context, provider, Widget? child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        provider.increment();
                      },
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${provider.number}',
                      style: const TextStyle(fontSize: 40),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        provider.decrement();
                      },
                      child: const Icon(Icons.remove),
                    )
                  ],
                ),
                extra["title"]!,
                extra["subtitle"]!,
                ElevatedButton(
                  onPressed: () {
                    context.go("/");
                  },
                  child: const Text("go back"),
                ),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                    },
                    child: const Text("theme"))
              ],
            ),
          );
        },
      ),
    );
  }
}
