import 'package:attendance_app/data/source/local/floor/enitities/attendance_entities.dart';
import 'package:attendance_app/data/source/local/floor/enitities/location_entities.dart';
import 'package:attendance_app/domains/model/location.dart';
import 'package:attendance_app/domains/model/attendance.dart';

class DataMapper {
  static List<Location> mapLocationEntitiesToDomains(
      List<LocationEntity> input) {
    return input.map((it) {
      return Location(
          id: it.id ?? 0,
          name: it.name ?? "",
          latitude: it.latitude ?? 0.0,
          longitude: it.longitude ?? 0.0,
          isActive: it.isActive ?? false,
          timeStamps: it.timeStamps ?? "");
    }).toList();
  }

  static LocationEntity mapLocationDomainToEntity(Location input) =>
      LocationEntity(
          id: input.id == 0 ? null : input.id,
          name: input.name,
          latitude: input.latitude,
          longitude: input.longitude,
          isActive: input.isActive,
          timeStamps: input.timeStamps);

  static Location mapLocationEntityToDomain(LocationEntity? input) => Location(
      id: input?.id ?? 0,
      name: input?.name ?? "",
      latitude: input?.latitude ?? 0.0,
      longitude: input?.longitude ?? 0.0,
      isActive: input?.isActive ?? false,
      timeStamps: input?.timeStamps ?? "");

  static List<Attendance> mapAttendanceEntitiesToDomains(
      List<AttendanceEntity> input) {
    return input.map((it) {
      return Attendance(
          id: it.id ?? 0,
          checkInTime: it.checkInTime ?? "",
          checkOutTime: it.checkOutTime ?? "",
          isWithinLocation: it.isWithinLocation ?? false,
          timeStamps: it.timeStamps ?? "");
    }).toList();
  }

  static AttendanceEntity mapAttendanceDomainToEntity(Attendance input) =>
      AttendanceEntity(
          id: input.id == 0 ? null : input.id,
          checkInTime: input.checkInTime,
          checkOutTime: input.checkOutTime,
          isWithinLocation: input.isWithinLocation,
          timeStamps: input.timeStamps);

  static Attendance mapAttendanceEntityToDomain(AttendanceEntity? input) =>
      Attendance(
          id: input?.id ?? 0,
          checkInTime: input?.checkInTime ?? "",
          checkOutTime: input?.checkOutTime ?? "",
          isWithinLocation: input?.isWithinLocation ?? false,
          timeStamps: input?.timeStamps ?? "");
}
