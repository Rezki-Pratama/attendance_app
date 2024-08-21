import 'package:dartz/dartz.dart';
import 'package:attendance_app/data/source/local_datasource/attendance_local_datasource/attendance_local_datasource.dart';
import 'package:attendance_app/data/source/response/failure.dart';
import 'package:attendance_app/domains/model/attendance.dart';
import 'package:attendance_app/domains/repository/attendance_repository.dart';
import 'package:attendance_app/utils/data_mapper.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceLocalDataSource _attendanceLocalDataSource;
  AttendanceRepositoryImpl(this._attendanceLocalDataSource);

  @override
  Future<Either<Failure, void>> deleteAttendance(Attendance attendance) async {
    try {
      final data = DataMapper.mapAttendanceDomainToEntity(attendance);
      await _attendanceLocalDataSource.deleteAttendance(data);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Attendance>>> findAllAttendance() async {
    try {
      final data = await _attendanceLocalDataSource.findAllAttendance();
      print(data.map((e) => e.timeStamps.toString()));
      return Right(DataMapper.mapAttendanceEntitiesToDomains(data));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Attendance?>> findAttendanceById(int id) async {
    try {
      final data = await _attendanceLocalDataSource.findAttendanceById(id);
      return Right(DataMapper.mapAttendanceEntityToDomain(data!));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> insertAttendance(Attendance attendance) async {
    try {
      final data = DataMapper.mapAttendanceDomainToEntity(attendance);
      await _attendanceLocalDataSource.insertAttendance(data);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateAttendance(Attendance attendance) async {
    try {
      final data = DataMapper.mapAttendanceDomainToEntity(attendance);
      await _attendanceLocalDataSource.updateAttendance(data);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
