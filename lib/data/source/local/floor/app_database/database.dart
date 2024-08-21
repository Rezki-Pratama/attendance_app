import 'dart:async';
import 'package:attendance_app/data/source/local/floor/dao/attendance_dao.dart';
import 'package:attendance_app/data/source/local/floor/enitities/location_entities.dart';
import 'package:floor/floor.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:attendance_app/data/source/local/floor/dao/location_dao.dart';
import 'package:attendance_app/data/source/local/floor/enitities/attendance_entities.dart';

part 'database.g.dart';

@Database(version: 1, entities: [LocationEntity, AttendanceEntity])
abstract class AppDatabase extends FloorDatabase {
  LocationDao get locationDao;
  AttendanceDao get attendanceDao;
}
