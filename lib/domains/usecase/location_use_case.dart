import 'package:dartz/dartz.dart';
import 'package:attendance_app/data/source/response/failure.dart';
import 'package:attendance_app/domains/model/location.dart';
import 'package:attendance_app/domains/repository/location_repository.dart';

class LocationUseCase {
  final LocationRepository _repository;
  LocationUseCase(this._repository);

  Future<Either<Failure, List<Location>>> execute() {
    return _repository.findAllLocation();
  }

  Future<Either<Failure, List<Location>>> findAllLocation() {
    return _repository.findAllLocation();
  }

  Future<Either<Failure, Location?>> findLocationById(int id) {
    return _repository.findLocationById(id);
  }

  Future<Either<Failure, void>> insertLocation(Location location) {
    return _repository.insertLocation(location);
  }

  Future<Either<Failure, void>> updateLocation(Location location) {
    return _repository.updateLocation(location);
  }

  Future<Either<Failure, void>> activeLocation(Location location) {
    return _repository.activeLocation(location);
  }

  Future<Either<Failure, void>> deleteLocation(Location location) {
    return _repository.deleteLocation(location);
  }
}
