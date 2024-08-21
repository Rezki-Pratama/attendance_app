import 'package:floor/floor.dart';

@entity
class LocationEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String? name;

  final double? latitude;

  final double? longitude;

  final bool? isActive;

  final String? timeStamps;

  LocationEntity(
      {
      // ignore: avoid_init_to_null
      this.id = null,
      this.name,
      this.latitude,
      this.longitude,
      this.isActive = false,
      this.timeStamps});
}
