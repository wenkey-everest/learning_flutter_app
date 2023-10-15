import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_flutter_app/domain/modals/custom_list_modal.dart';

Widget customListTile(CustomListTile tile, BuildContext context) {
  return ListTile(
    title: tile.buildTitle(context),
    subtitle: tile.buildSubTitle(context),
    onTap: () {
      context.goNamed("DetailsScreen", extra: <String, Widget>{
        "title": tile.buildTitle(context),
        "subtitle": tile.buildSubTitle(context)
      });
    },
  );
}
