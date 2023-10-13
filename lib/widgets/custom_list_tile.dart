import 'package:flutter/material.dart';
import 'package:learning_flutter_app/cutsom_list_tile.dart';

Widget customListTile(CustomListTile tile, BuildContext context) {
  return ListTile(
    title: tile.buildTitle(context),
    subtitle: tile.buildSubTitle(context),
    onTap: () {
      Navigator.pushNamed(context, "/details", arguments: <String, Widget>{
        "title": tile.buildTitle(context),
        "subtitle": tile.buildSubTitle(context)
      });
    },
  );
}
