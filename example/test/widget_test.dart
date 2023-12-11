// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // The button will be shown first
    expect(find.text('Add Item'), findsOneWidget);

    // Tapp the button to start the counter
    await tester.tap(find.text('Add Item'));
    await tester.pump();

    // Verify that our counter starts at 1 (because of the Add Item).
    expect(find.text('1%'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('1%'), findsNothing);
    expect(find.text('2%'), findsOneWidget);
  });
}
