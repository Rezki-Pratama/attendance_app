import 'package:get_it/get_it.dart';
import 'package:attendance_app/data/repository/location_repository/location_repository_impl.dart';
import 'package:attendance_app/data/repository/attendance_repository/attendance_repository_impl.dart';
import 'package:attendance_app/domains/repository/location_repository.dart';

import '../domains/repository/attendance_repository.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(
      locator(),
    ),
  );

  locator.registerLazySingleton<AttendanceRepository>(
    () => AttendanceRepositoryImpl(
      locator(),
    ),
  );
}
