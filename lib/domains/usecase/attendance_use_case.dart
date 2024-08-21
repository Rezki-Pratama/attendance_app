import 'package:dartz/dartz.dart';
import 'package:attendance_app/data/source/response/failure.dart';
import 'package:attendance_app/domains/model/attendance.dart';
import 'package:attendance_app/domains/repository/attendance_repository.dart';

class AttendanceUseCase {
  final AttendanceRepository _repository;
  AttendanceUseCase(this._repository);

  Future<Either<Failure, List<Attendance>>> execute() {
    return _repository.findAllAttendance();
  }

  Future<Either<Failure, List<Attendance>>> findAllAttendance() {
    return _repository.findAllAttendance();
  }

  Future<Either<Failure, Attendance?>> findAttendanceById(int id) {
    return _repository.findAttendanceById(id);
  }

  Future<Either<Failure, void>> insertAttendance(Attendance attendance) {
    return _repository.insertAttendance(attendance);
  }

  Future<Either<Failure, void>> updateAttendance(Attendance attendance) {
    return _repository.updateAttendance(attendance);
  }

  Future<Either<Failure, void>> deleteAttendance(Attendance attendance) {
    return _repository.deleteAttendance(attendance);
  }
}
