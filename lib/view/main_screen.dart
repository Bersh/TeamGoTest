import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:team_go_test/repo/events_db.dart';
import 'package:team_go_test/view/detail_screen.dart';

import '../app_localizations.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "";
  final DateFormat dateFormat = new DateFormat("dd-MM-yyyy hh:mm");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  StreamBuilder<List<Event>> _buildTaskList(BuildContext context) {
    final EventsDao dao = Provider.of<EventsDao>(context);
    return StreamBuilder(
      stream: dao.watchAllEvents(),
      builder: (context, AsyncSnapshot<List<Event>> snapshot) {
        final events = snapshot.data ?? List();

        return ListView.builder(
          itemCount: events.length,
          itemBuilder: (_, index) {
            final item = events[index];
            return _buildListItem(item, dao);
          },
        );
      },
    );
  }

  Widget _buildListItem(Event event, EventsDao dao) {
    return Card(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: ListTile(
              title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text((event.name))),
              subtitle: Text(_getItemSubtitle(
                  event.organiser, event.location, event.time)),
              onTap: () {
                _openDetails(event);
              },
            )));
  }

  void _openDetails(Event event) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(event)),
    );
  }

  String _getItemSubtitle(String who, String where, DateTime when) {
    AppLocalizations local = AppLocalizations.of(context);
    return "${local.translate("organizer")}: $who, "
        "${local.translate("location")}: $where, "
        "${local.translate("time")}: ${dateFormat.format(when)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title:
              Text(AppLocalizations.of(context).translate("main_screen_title")),
        ),
        body: Container(
          child: _buildTaskList(context),
        ),
        resizeToAvoidBottomPadding: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _openDetails(null);
          },
          child: Icon(Icons.add),
        ));
  }
}
