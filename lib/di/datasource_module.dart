import 'package:attendance_app/data/source/local_datasource/attendance_local_datasource/attendance_local_datasource.dart';
import 'package:attendance_app/data/source/local_datasource/attendance_local_datasource/attendance_local_datasource_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:attendance_app/data/source/local_datasource/location_local_datasource/location_local_datasource.dart';
import 'package:attendance_app/data/source/local_datasource/location_local_datasource/location_local_datasource_impl.dart';

final locator = GetIt.instance;

init() {
  locator.registerLazySingleton<LocationLocalDataSource>(
    () => LocationLocalDataSourceImpl(
      locator(),
    ),
  );

  locator.registerLazySingleton<AttendanceLocalDataSource>(
    () => AttendanceLocalDataSourceImpl(
      locator(),
    ),
  );
}
