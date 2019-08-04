import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:team_go_test/repo/events_db.dart';
import 'package:team_go_test/view/main_screen.dart';

import 'app_localizations.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<void> _initDbIfNeeded(BuildContext context, EventsDao dao) async {
    int count = (await dao.eventsCount())[0].count;
    if (count == 0) {
      //DB is empty. Create db
      var str = await DefaultAssetBundle.of(context)
          .loadString('data/mock_data.json');
      final parsed = json.decode(str).cast<Map<String, dynamic>>();
      var list = parsed.map<Event>((json) => new Event.fromJson(json)).toList();
      for (var event in list) {
        dao.insertEvent(event);
      }
    }
    return;
  }

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    final db = EventsDB();
    _initDbIfNeeded(context, db.eventsDao);
    return Provider(
        builder: (_) => db.eventsDao,
        child: MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: [
            Locale("en", "US"),
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          home: MyHomePage(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ));
  }
}
