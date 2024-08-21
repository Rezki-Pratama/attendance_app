import 'package:attendance_app/data/source/local/floor/enitities/location_entities.dart';

abstract class LocationLocalDataSource {
  Future<List<LocationEntity>> findAllLocation();
  Future<LocationEntity?> findLocationById(int id);
  Future<void> insertLocation(LocationEntity location);
  Future<void> updateLocation(LocationEntity location);
  Future<void> setLocationActive(LocationEntity location);
  Future<void> setAllLocationsInactive();
  Future<void> deleteLocation(LocationEntity location);
}
