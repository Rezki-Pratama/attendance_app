import 'package:dartz/dartz.dart';
import 'package:attendance_app/data/source/response/failure.dart';
import 'package:attendance_app/domains/model/attendance.dart';

abstract class AttendanceRepository {
  Future<Either<Failure, List<Attendance>>> findAllAttendance();
  Future<Either<Failure, Attendance?>> findAttendanceById(int id);
  Future<Either<Failure, void>> insertAttendance(Attendance attendance);
  Future<Either<Failure, void>> updateAttendance(Attendance attendance);
  Future<Either<Failure, void>> deleteAttendance(Attendance attendance);
}
