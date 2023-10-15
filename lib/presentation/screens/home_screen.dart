import 'package:flutter/material.dart';
import 'package:learning_flutter_app/domain/modals/custom_list_modal.dart';
import 'package:learning_flutter_app/presentation/widgets/custom_list_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final items =
      List<CustomListTile>.generate(1000, (i) => Heading('Heading $i'));

  @override
  Widget build(BuildContext context) {
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
}
