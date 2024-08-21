import 'package:get_it/get_it.dart';
import 'package:attendance_app/domains/usecase/location_use_case.dart';
import 'package:attendance_app/domains/usecase/attendance_use_case.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton(() => LocationUseCase(locator()));
  locator.registerLazySingleton(() => AttendanceUseCase(locator()));
}
