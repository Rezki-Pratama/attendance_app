import 'package:attendance_app/data/source/local/floor/enitities/location_entities.dart';
import 'package:floor/floor.dart';

@dao
abstract class LocationDao {
  @Query('SELECT * FROM LocationEntity')
  Future<List<LocationEntity>> findAllLocation();

  @Query('SELECT * FROM LocationEntity WHERE id = :id')
  Future<LocationEntity?> findLocationById(int id);

  @insert
  Future<void> insertLocation(LocationEntity location);

  @update
  Future<void> updateLocation(LocationEntity location);

  @delete
  Future<void> deleteLocation(LocationEntity location);

  @Query('UPDATE LocationEntity SET isActive = 1 WHERE id = :id')
  Future<void> setLocationActive(int id);

  @Query('UPDATE LocationEntity SET isActive = 0')
  Future<void> setAllLocationsInactive();
}
