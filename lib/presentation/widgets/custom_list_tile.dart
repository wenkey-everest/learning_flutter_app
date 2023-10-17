import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_flutter_app/domain/modals/article.dart';

Widget customListTile(Article article, BuildContext context) {
  return ListTile(
    title: Text(article.title!),
    subtitle: Text(article.content ?? "content is null"),
    onTap: () {
      context.goNamed("DetailsScreen", extra: <String, String>{
        "title": article.title!,
        "subtitle": article.content!
      });
    },
  );
}
