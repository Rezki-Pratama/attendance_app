import 'package:attendance_app/data/source/local/floor/dao/attendance_dao.dart';
import 'package:attendance_app/data/source/local/floor/enitities/attendance_entities.dart';
import 'package:attendance_app/data/source/local_datasource/attendance_local_datasource/attendance_local_datasource.dart';

class AttendanceLocalDataSourceImpl implements AttendanceLocalDataSource {
  final AttendanceDao _attendanceDao;
  AttendanceLocalDataSourceImpl(this._attendanceDao);

  @override
  Future<void> deleteAttendance(AttendanceEntity attendance) async {
    return await _attendanceDao.deleteAttendance(attendance);
  }

  @override
  Future<List<AttendanceEntity>> findAllAttendance() async {
    return await _attendanceDao.findAllAttendance();
  }

  @override
  Future<AttendanceEntity?> findAttendanceById(int id) async {
    return await _attendanceDao.findAttendanceById(id);
  }

  @override
  Future<void> insertAttendance(AttendanceEntity attendance) async {
    return await _attendanceDao.insertAttendance(attendance);
  }

  @override
  Future<void> updateAttendance(AttendanceEntity attendance) async {
    return await _attendanceDao.updateAttendance(attendance);
  }
}
