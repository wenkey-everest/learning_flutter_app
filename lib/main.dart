import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter_app/cutsom_list_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: listViewWidget(),
    );
  }
}

Widget listViewWidget() {
  final items =
      List<CustomListTile>.generate(1000, (i) => Heading('Heading $i'));
  return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return customListTile(items[index], context);
        },
      ));
}

Widget customListTile(CustomListTile tile, BuildContext context) {
  return ListTile(
    title: tile.buildTitle(context),
    subtitle: tile.buildSubTitle(context),
  );
}
