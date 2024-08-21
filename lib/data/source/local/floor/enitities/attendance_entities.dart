import 'package:floor/floor.dart';

@entity
class AttendanceEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String? checkInTime;

  final String? checkOutTime;

  final bool? isWithinLocation;

  final String? timeStamps;

  AttendanceEntity(
      {
      // ignore: avoid_init_to_null
      this.id = null,
      this.checkInTime,
      this.checkOutTime,
      this.isWithinLocation,
      this.timeStamps});
}
