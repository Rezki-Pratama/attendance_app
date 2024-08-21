import 'package:attendance_app/data/source/local/floor/enitities/attendance_entities.dart';

abstract class AttendanceLocalDataSource {
  Future<List<AttendanceEntity>> findAllAttendance();
  Future<AttendanceEntity?> findAttendanceById(int id);
  Future<void> insertAttendance(AttendanceEntity attendance);
  Future<void> updateAttendance(AttendanceEntity attendance);
  Future<void> deleteAttendance(AttendanceEntity attendance);
}
