import 'package:attendance_app/features/bloc/location_bloc/location_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:attendance_app/features/bloc/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:attendance_app/features/bloc/attendance_bloc/attendance_bloc.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => LocationBloc(locator()));
  locator.registerFactory(() => AttendanceBloc(locator()));
  locator.registerFactory(() => BottomNavigationCubit());
}
