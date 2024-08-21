import 'package:dartz/dartz.dart';
import 'package:attendance_app/data/source/local_datasource/location_local_datasource/location_local_datasource.dart';
import 'package:attendance_app/data/source/response/failure.dart';
import 'package:attendance_app/domains/model/location.dart';
import 'package:attendance_app/domains/repository/location_repository.dart';
import 'package:attendance_app/utils/data_mapper.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationLocalDataSource _locationLocalDataSource;
  LocationRepositoryImpl(this._locationLocalDataSource);

  @override
  Future<Either<Failure, void>> deleteLocation(Location location) async {
    try {
      final data = DataMapper.mapLocationDomainToEntity(location);
      await _locationLocalDataSource.deleteLocation(data);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Location?>> findLocationById(int id) async {
    try {
      final data = await _locationLocalDataSource.findLocationById(id);
      return Right(DataMapper.mapLocationEntityToDomain(data!));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Location>>> findAllLocation() async {
    try {
      final data = await _locationLocalDataSource.findAllLocation();
      return Right(DataMapper.mapLocationEntitiesToDomains(data));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> insertLocation(Location location) async {
    try {
      final data = DataMapper.mapLocationDomainToEntity(location);
      await _locationLocalDataSource.setAllLocationsInactive();
      await _locationLocalDataSource.insertLocation(data);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateLocation(Location location) async {
    try {
      final data = DataMapper.mapLocationDomainToEntity(location);
      await _locationLocalDataSource.updateLocation(data);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> activeLocation(Location location) async {
    try {
      final data = DataMapper.mapLocationDomainToEntity(location);
      await _locationLocalDataSource.setAllLocationsInactive();
      await _locationLocalDataSource.setLocationActive(data);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
