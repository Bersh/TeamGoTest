// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Event extends DataClass implements Insertable<Event> {
  final int id;
  final String name;
  final String organiser;
  final String location;
  final DateTime time;
  Event(
      {@required this.id,
      @required this.name,
      @required this.organiser,
      @required this.location,
      @required this.time});
  factory Event.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Event(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      organiser: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}organiser']),
      location: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
      time:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}time']),
    );
  }
  factory Event.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Event(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      organiser: serializer.fromJson<String>(json['organiser']),
      location: serializer.fromJson<String>(json['location']),
      time: serializer.fromJson<DateTime>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'organiser': serializer.toJson<String>(organiser),
      'location': serializer.toJson<String>(location),
      'time': serializer.toJson<DateTime>(time),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Event>>(bool nullToAbsent) {
    return EventsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      organiser: organiser == null && nullToAbsent
          ? const Value.absent()
          : Value(organiser),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
    ) as T;
  }

  Event copyWith(
          {int id,
          String name,
          String organiser,
          String location,
          DateTime time}) =>
      Event(
        id: id ?? this.id,
        name: name ?? this.name,
        organiser: organiser ?? this.organiser,
        location: location ?? this.location,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('organiser: $organiser, ')
          ..write('location: $location, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      $mrjc(
          $mrjc(
              $mrjc($mrjc(0, id.hashCode), name.hashCode), organiser.hashCode),
          location.hashCode),
      time.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == id &&
          other.name == name &&
          other.organiser == organiser &&
          other.location == location &&
          other.time == time);
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> organiser;
  final Value<String> location;
  final Value<DateTime> time;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.organiser = const Value.absent(),
    this.location = const Value.absent(),
    this.time = const Value.absent(),
  });
}

class $EventsTable extends Events with TableInfo<$EventsTable, Event> {
  final GeneratedDatabase _db;
  final String _alias;
  $EventsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false, hasAutoIncrement: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _organiserMeta = const VerificationMeta('organiser');
  GeneratedTextColumn _organiser;
  @override
  GeneratedTextColumn get organiser => _organiser ??= _constructOrganiser();
  GeneratedTextColumn _constructOrganiser() {
    return GeneratedTextColumn(
      'organiser',
      $tableName,
      false,
    );
  }

  final VerificationMeta _locationMeta = const VerificationMeta('location');
  GeneratedTextColumn _location;
  @override
  GeneratedTextColumn get location => _location ??= _constructLocation();
  GeneratedTextColumn _constructLocation() {
    return GeneratedTextColumn(
      'location',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timeMeta = const VerificationMeta('time');
  GeneratedDateTimeColumn _time;
  @override
  GeneratedDateTimeColumn get time => _time ??= _constructTime();
  GeneratedDateTimeColumn _constructTime() {
    return GeneratedDateTimeColumn(
      'time',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, organiser, location, time];
  @override
  $EventsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'events';
  @override
  final String actualTableName = 'events';
  @override
  VerificationContext validateIntegrity(EventsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.organiser.present) {
      context.handle(_organiserMeta,
          organiser.isAcceptableValue(d.organiser.value, _organiserMeta));
    } else if (organiser.isRequired && isInserting) {
      context.missing(_organiserMeta);
    }
    if (d.location.present) {
      context.handle(_locationMeta,
          location.isAcceptableValue(d.location.value, _locationMeta));
    } else if (location.isRequired && isInserting) {
      context.missing(_locationMeta);
    }
    if (d.time.present) {
      context.handle(
          _timeMeta, time.isAcceptableValue(d.time.value, _timeMeta));
    } else if (time.isRequired && isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Event map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Event.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(EventsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.organiser.present) {
      map['organiser'] = Variable<String, StringType>(d.organiser.value);
    }
    if (d.location.present) {
      map['location'] = Variable<String, StringType>(d.location.value);
    }
    if (d.time.present) {
      map['time'] = Variable<DateTime, DateTimeType>(d.time.value);
    }
    return map;
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(_db, alias);
  }
}

abstract class _$EventsDB extends GeneratedDatabase {
  _$EventsDB(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $EventsTable _events;
  $EventsTable get events => _events ??= $EventsTable(this);
  EventsDao _eventsDao;
  EventsDao get eventsDao => _eventsDao ??= EventsDao(this as EventsDB);
  @override
  List<TableInfo> get allTables => [events];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$EventsDaoMixin on DatabaseAccessor<EventsDB> {
  $EventsTable get events => db.events;
  EventsCountResult _rowToEventsCountResult(QueryRow row) {
    return EventsCountResult(
      count: row.readInt('COUNT(*)'),
    );
  }

  Future<List<EventsCountResult>> eventsCount(
      {@Deprecated('No longer needed with Moor 1.6 - see the changelog for details')
          QueryEngine operateOn}) {
    return (operateOn ?? this)
        .customSelect('SELECT COUNT(*) FROM events;', variables: []).then(
            (rows) => rows.map(_rowToEventsCountResult).toList());
  }

  Stream<List<EventsCountResult>> watchEventsCount() {
    return customSelectStream('SELECT COUNT(*) FROM events;',
            variables: [], readsFrom: {events})
        .map((rows) => rows.map(_rowToEventsCountResult).toList());
  }
}

class EventsCountResult {
  final int count;
  EventsCountResult({
    this.count,
  });
}
