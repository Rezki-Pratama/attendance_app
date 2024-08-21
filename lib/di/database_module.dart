import 'package:attendance_app/data/source/local/floor/app_database/database.dart';
import 'package:attendance_app/data/source/local/floor/dao/attendance_dao.dart';
import 'package:get_it/get_it.dart';
import 'package:attendance_app/data/source/local/floor/dao/location_dao.dart';

final locator = GetIt.instance;

Future init() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('attendance_database.db').build();

  final locationDao = database.locationDao;
  final attendanceDao = database.attendanceDao;

  locator.registerSingleton<LocationDao>(locationDao);

  locator.registerSingleton<AttendanceDao>(attendanceDao);
}
