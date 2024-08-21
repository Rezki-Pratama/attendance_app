// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  LocationDao? _locationDaoInstance;

  AttendanceDao? _attendanceDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `LocationEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `latitude` REAL, `longitude` REAL, `isActive` INTEGER, `timeStamps` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AttendanceEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `checkInTime` TEXT, `checkOutTime` TEXT, `isWithinLocation` INTEGER, `timeStamps` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  LocationDao get locationDao {
    return _locationDaoInstance ??= _$LocationDao(database, changeListener);
  }

  @override
  AttendanceDao get attendanceDao {
    return _attendanceDaoInstance ??= _$AttendanceDao(database, changeListener);
  }
}

class _$LocationDao extends LocationDao {
  _$LocationDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _locationEntityInsertionAdapter = InsertionAdapter(
            database,
            'LocationEntity',
            (LocationEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'isActive':
                      item.isActive == null ? null : (item.isActive! ? 1 : 0),
                  'timeStamps': item.timeStamps
                }),
        _locationEntityUpdateAdapter = UpdateAdapter(
            database,
            'LocationEntity',
            ['id'],
            (LocationEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'isActive':
                      item.isActive == null ? null : (item.isActive! ? 1 : 0),
                  'timeStamps': item.timeStamps
                }),
        _locationEntityDeletionAdapter = DeletionAdapter(
            database,
            'LocationEntity',
            ['id'],
            (LocationEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'isActive':
                      item.isActive == null ? null : (item.isActive! ? 1 : 0),
                  'timeStamps': item.timeStamps
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<LocationEntity> _locationEntityInsertionAdapter;

  final UpdateAdapter<LocationEntity> _locationEntityUpdateAdapter;

  final DeletionAdapter<LocationEntity> _locationEntityDeletionAdapter;

  @override
  Future<List<LocationEntity>> findAllLocation() async {
    return _queryAdapter.queryList('SELECT * FROM LocationEntity',
        mapper: (Map<String, Object?> row) => LocationEntity(
            id: row['id'] as int?,
            name: row['name'] as String?,
            latitude: row['latitude'] as double?,
            longitude: row['longitude'] as double?,
            isActive:
                row['isActive'] == null ? null : (row['isActive'] as int) != 0,
            timeStamps: row['timeStamps'] as String?));
  }

  @override
  Future<LocationEntity?> findLocationById(int id) async {
    return _queryAdapter.query('SELECT * FROM LocationEntity WHERE id = ?1',
        mapper: (Map<String, Object?> row) => LocationEntity(
            id: row['id'] as int?,
            name: row['name'] as String?,
            latitude: row['latitude'] as double?,
            longitude: row['longitude'] as double?,
            isActive:
                row['isActive'] == null ? null : (row['isActive'] as int) != 0,
            timeStamps: row['timeStamps'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> setLocationActive(int id) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE LocationEntity SET isActive = 1 WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> setAllLocationsInactive() async {
    await _queryAdapter.queryNoReturn('UPDATE LocationEntity SET isActive = 0');
  }

  @override
  Future<void> insertLocation(LocationEntity location) async {
    await _locationEntityInsertionAdapter.insert(
        location, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateLocation(LocationEntity location) async {
    await _locationEntityUpdateAdapter.update(
        location, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteLocation(LocationEntity location) async {
    await _locationEntityDeletionAdapter.delete(location);
  }
}

class _$AttendanceDao extends AttendanceDao {
  _$AttendanceDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _attendanceEntityInsertionAdapter = InsertionAdapter(
            database,
            'AttendanceEntity',
            (AttendanceEntity item) => <String, Object?>{
                  'id': item.id,
                  'checkInTime': item.checkInTime,
                  'checkOutTime': item.checkOutTime,
                  'isWithinLocation': item.isWithinLocation == null
                      ? null
                      : (item.isWithinLocation! ? 1 : 0),
                  'timeStamps': item.timeStamps
                }),
        _attendanceEntityUpdateAdapter = UpdateAdapter(
            database,
            'AttendanceEntity',
            ['id'],
            (AttendanceEntity item) => <String, Object?>{
                  'id': item.id,
                  'checkInTime': item.checkInTime,
                  'checkOutTime': item.checkOutTime,
                  'isWithinLocation': item.isWithinLocation == null
                      ? null
                      : (item.isWithinLocation! ? 1 : 0),
                  'timeStamps': item.timeStamps
                }),
        _attendanceEntityDeletionAdapter = DeletionAdapter(
            database,
            'AttendanceEntity',
            ['id'],
            (AttendanceEntity item) => <String, Object?>{
                  'id': item.id,
                  'checkInTime': item.checkInTime,
                  'checkOutTime': item.checkOutTime,
                  'isWithinLocation': item.isWithinLocation == null
                      ? null
                      : (item.isWithinLocation! ? 1 : 0),
                  'timeStamps': item.timeStamps
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AttendanceEntity> _attendanceEntityInsertionAdapter;

  final UpdateAdapter<AttendanceEntity> _attendanceEntityUpdateAdapter;

  final DeletionAdapter<AttendanceEntity> _attendanceEntityDeletionAdapter;

  @override
  Future<List<AttendanceEntity>> findAllAttendance() async {
    return _queryAdapter.queryList(
        'SELECT * FROM AttendanceEntity ORDER BY timeStamps DESC',
        mapper: (Map<String, Object?> row) => AttendanceEntity(
            id: row['id'] as int?,
            checkInTime: row['checkInTime'] as String?,
            checkOutTime: row['checkOutTime'] as String?,
            isWithinLocation: row['isWithinLocation'] == null
                ? null
                : (row['isWithinLocation'] as int) != 0,
            timeStamps: row['timeStamps'] as String?));
  }

  @override
  Future<AttendanceEntity?> findAttendanceById(int id) async {
    return _queryAdapter.query('SELECT * FROM AttendanceEntity WHERE id = ?1',
        mapper: (Map<String, Object?> row) => AttendanceEntity(
            id: row['id'] as int?,
            checkInTime: row['checkInTime'] as String?,
            checkOutTime: row['checkOutTime'] as String?,
            isWithinLocation: row['isWithinLocation'] == null
                ? null
                : (row['isWithinLocation'] as int) != 0,
            timeStamps: row['timeStamps'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertAttendance(AttendanceEntity attendance) async {
    await _attendanceEntityInsertionAdapter.insert(
        attendance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAttendance(AttendanceEntity attendance) async {
    await _attendanceEntityUpdateAdapter.update(
        attendance, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteAttendance(AttendanceEntity attendance) async {
    await _attendanceEntityDeletionAdapter.delete(attendance);
  }
}
