import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:team_go_test/repo/events_db.dart';

import '../app_localizations.dart';

class DetailScreen extends StatefulWidget {
  final Event _event;

  DetailScreen(this._event);

  @override
  State<StatefulWidget> createState() {
    return _DetailsState(_event);
  }
}

class _DetailsState extends State<DetailScreen> {
  final Event _event;

  _DetailsState(this._event);

  final DateFormat _dateFormat = new DateFormat("dd-MM-yyyy hh:mm");
  TextEditingController _nameInputController = new TextEditingController();
  TextEditingController _orgInputController = new TextEditingController();
  TextEditingController _locationInputController = new TextEditingController();
  DateTime _dateTime = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  Widget _getDataText(String data) {
    return Expanded(
        child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              data,
              style: TextStyle(fontSize: 20),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )));
  }

  Widget _getTitleText(String title) {
    return Text(title + ": ",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }

  Widget _createDataRow(String title, String data) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_getTitleText(title), _getDataText(data)],
        ));
  }

  Widget _createInputRow(
      AppLocalizations local, String title, TextEditingController controller) {
    return TextFormField(
      decoration: InputDecoration(hintText: title),
      controller: controller,
      onEditingComplete: () {
        _formKey.currentState.validate();
      },
      validator: (value) {
        if (value.isEmpty) {
          return local.translate("empty_value");
        }
        return null;
      },
    );
  }

  Widget _createSaveButton(AppLocalizations local, EventsDao dao) {
    return Container(
        alignment: Alignment.centerRight,
        margin: new EdgeInsets.only(top: 10.0),
        child: FlatButton.icon(
            color: Colors.blue,
            icon: Icon(Icons.save),
            label: Text(local.translate("save")),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                dao.insertEvent(Event(
                    name: _nameInputController.text,
                    organiser: _orgInputController.text,
                    location: _locationInputController.text,
                    time: _dateTime));
                Navigator.pop(context);
              }
            }));
  }

  Widget _createDeleteButton(
      AppLocalizations local, EventsDao dao, Event event) {
    return Container(
        alignment: Alignment.centerRight,
        margin: new EdgeInsets.only(top: 10.0),
        child: FlatButton.icon(
            color: Colors.red,
            icon: Icon(Icons.delete_forever),
            label: Text(local.translate("delete")),
            onPressed: () {
              dao.deleteEvent(event);
              Navigator.pop(context);
            }));
  }

  Widget _createDateButton(AppLocalizations local) {
    return DateTimeField(
      format: _dateFormat,
      autovalidate: true,
      initialValue: _dateTime,
      decoration: InputDecoration(
          hintText: local.translate("date_time"), alignLabelWithHint: true),
      onSaved: (date) => setState(() {
        _dateTime = date;
      }),
      onShowPicker: (context, currentValue) async {
        final date = await showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
        if (date != null) {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.combine(date, time);
        } else {
          return currentValue;
        }
      },
      validator: (date) =>
          date == null ? local.translate("invalid_date") : null,
    );
  }

  List<Widget> _createDetailsWidgets(
      AppLocalizations local, EventsDao dao, Event event) {
    List<Widget> result = [];
    if (event != null) {
      result.add(_createDataRow(local.translate("id"), _event.id.toString()));
      result
          .add(_createDataRow(local.translate("name"), _event.name.toString()));
      result.add(_createDataRow(
          local.translate("organizer"), _event.organiser.toString()));
      result.add(_createDataRow(
          local.translate("location"), _event.location.toString()));
      result.add(_createDataRow(
          local.translate("date_time"), _dateFormat.format(_event.time)));
      result.add(_createDeleteButton(local, dao, _event));
    } else {
      result.add(_createInputRow(
          local, local.translate("name"), _nameInputController));
      result.add(_createInputRow(
          local, local.translate("organizer"), _orgInputController));
      result.add(_createInputRow(
          local, local.translate("location"), _locationInputController));
      result.add(_createDateButton(local));
      result.add(_createSaveButton(local, dao));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final EventsDao dao = Provider.of<EventsDao>(context);
    AppLocalizations local = AppLocalizations.of(context);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(
              AppLocalizations.of(context).translate("details_screen_title")),
        ),
        body: Container(
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _createDetailsWidgets(local, dao, _event)),
                ))));
  }
}
