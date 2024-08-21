import 'package:dartz/dartz.dart';
import 'package:attendance_app/data/source/response/failure.dart';
import 'package:attendance_app/domains/model/location.dart';

abstract class LocationRepository {
  Future<Either<Failure, List<Location>>> findAllLocation();
  Future<Either<Failure, Location?>> findLocationById(int id);
  Future<Either<Failure, void>> insertLocation(Location location);
  Future<Either<Failure, void>> updateLocation(Location location);
  Future<Either<Failure, void>> activeLocation(Location location);
  Future<Either<Failure, void>> deleteLocation(Location location);
}
