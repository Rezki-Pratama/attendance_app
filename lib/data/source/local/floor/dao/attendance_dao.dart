import 'package:attendance_app/data/source/local/floor/enitities/attendance_entities.dart';
import 'package:floor/floor.dart';

@dao
abstract class AttendanceDao {
  @Query('SELECT * FROM AttendanceEntity ORDER BY timeStamps DESC')
  Future<List<AttendanceEntity>> findAllAttendance();

  @Query('SELECT * FROM AttendanceEntity WHERE id = :id')
  Future<AttendanceEntity?> findAttendanceById(int id);

  @insert
  Future<void> insertAttendance(AttendanceEntity attendance);

  @update
  Future<void> updateAttendance(AttendanceEntity attendance);

  @delete
  Future<void> deleteAttendance(AttendanceEntity attendance);
}
