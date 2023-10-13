// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter_app/main.dart';

void main() {
  testWidgets('Should render InputField, button and text',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byKey(const Key("check-button")), findsOneWidget);
  });
  testWidgets("Should check the given number is Even or Odd",
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Even'), findsOneWidget);

    await tester.enterText(find.byType(TextField), "101");
    await tester.tap(find.byKey(const Key("check-button")));
    await tester.pump();

    expect(find.text('Odd'), findsOneWidget);
  });
}
