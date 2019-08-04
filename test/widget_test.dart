// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:team_go_test/main.dart';

void main() {
  testWidgets('List present smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    await tester.pump();
    expect(find.byType(ListView), findsOneWidget);
  });

/*
  testWidgets('Test details for exisitng event', (WidgetTester tester) async {
    Event event = Event(
        id: 1,
        name: "aaa",
        organiser: "bbb",
        location: "loc",
        time: DateTime.now());
    await tester.pumpWidget(DetailScreen(event));

    expect(find.byType(TextFormField), findsNothing);
//    expect(find.text(event.id.toString()), findsOneWidget);
    expect(find.text(event.name), findsOneWidget);
    expect(find.text(event.location), findsOneWidget);
    expect(find.byType(DateTimeField), findsOneWidget);
  });
*/


/*  testWidgets('List present smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();
    expect(find.text("Activity1"), findsOneWidget);
  });*/
}
