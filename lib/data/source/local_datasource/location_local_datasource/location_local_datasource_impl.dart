import 'package:attendance_app/data/source/local/floor/dao/location_dao.dart';
import 'package:attendance_app/data/source/local/floor/enitities/location_entities.dart';
import 'package:attendance_app/data/source/local_datasource/location_local_datasource/location_local_datasource.dart';

class LocationLocalDataSourceImpl implements LocationLocalDataSource {
  final LocationDao _locationDao;
  LocationLocalDataSourceImpl(this._locationDao);

  @override
  Future<void> deleteLocation(LocationEntity location) async {
    return await _locationDao.deleteLocation(location);
  }

  @override
  Future<LocationEntity?> findLocationById(int id) async {
    return await _locationDao.findLocationById(id);
  }

  @override
  Future<List<LocationEntity>> findAllLocation() async {
    return await _locationDao.findAllLocation();
  }

  @override
  Future<void> insertLocation(LocationEntity location) async {
    return await _locationDao.insertLocation(location);
  }

  @override
  Future<void> updateLocation(LocationEntity location) async {
    return await _locationDao.updateLocation(location);
  }

  @override
  Future<void> setLocationActive(LocationEntity location) async {
    return await _locationDao.setLocationActive(location.id!);
  }

  @override
  Future<void> setAllLocationsInactive() async {
    return await _locationDao.setAllLocationsInactive();
  }
}
