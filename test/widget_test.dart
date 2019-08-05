// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:team_go_test/main.dart';
import 'package:team_go_test/repo/events_db.dart';

void main() {
  testWidgets('List present smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    await tester.pump();
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('List itmes loaded test', (WidgetTester tester) async {
    var mockDao = MockDao();
    EventsCountResult result = EventsCountResult(count: 10);
    List<Event> events = [];
    events.add(Event(
        id: 1,
        name: "Event1",
        organiser: "Org1",
        location: "Loc1",
        time: DateTime.now()));
    events.add(Event(
        id: 2,
        name: "Event2",
        organiser: "Org2",
        location: "Loc2",
        time: DateTime.now()));
    events.add(Event(
        id: 3,
        name: "Event3",
        organiser: "Org3",
        location: "Loc3",
        time: DateTime.now()));
    when(mockDao.eventsCount()).thenAnswer((_) => Future.value([result]));
    when(mockDao.watchAllEvents())
        .thenAnswer((_) => Stream<List<Event>>.fromIterable([events]));
    await tester.pumpWidget(MyApp(eventsDao: mockDao));
    await tester.pump();

    new FakeAsync().run((async) async {
      verify(mockDao.eventsCount());
      verify(mockDao.watchAllEvents());
      expect(find.text("Event1"), findsOneWidget);
      expect(find.text("Event2"), findsOneWidget);
      expect(find.text("Event3"), findsOneWidget);
    });
  });
}

class MockDao extends Mock implements EventsDao {}
