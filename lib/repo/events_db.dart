import 'package:moor_flutter/moor_flutter.dart';

part 'events_db.g.dart';

@UseMoor(tables: [Events], daos: [EventsDao])
class EventsDB extends _$EventsDB {
  // we tell the database where to store the data with this constructor
  EventsDB() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;
}

@DataClassName("Event")
class Events extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get organiser => text()();

  TextColumn get location => text()();

  DateTimeColumn get time => dateTime()();
}

@UseDao(
  tables: [Events],
    queries: {
      'eventsCount':
      'SELECT COUNT(*) FROM events;'
    }
)
class EventsDao extends DatabaseAccessor<EventsDB> with _$EventsDaoMixin {
  final EventsDB db;

  EventsDao(this.db) : super(db);

  Stream<List<Event>> watchAllEvents() {
    return (select(events)
          ..orderBy(
            [
              (event) =>
                  OrderingTerm(expression: event.time, mode: OrderingMode.asc),
            ],
          ))
        .watch();
  }

  Future insertEvent(Insertable<Event> event) => into(events).insert(event);

  Future updateEvent(Insertable<Event> event) => update(events).replace(event);

  Future deleteEvent(Insertable<Event> event) => delete(events).delete(event);
}
