import 'package:flutter/material.dart';

abstract class CustomListTile {
  Widget buildTitle(BuildContext context);

  Widget buildSubTitle(BuildContext context);
}

class Heading extends CustomListTile {
  final String heading;

  Heading(this.heading);

  @override
  Widget buildSubTitle(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.bodyMedium);
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.headlineMedium);
  }
}


