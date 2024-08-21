part of 'attendance_bloc.dart';

abstract class AttendanceEvent extends Equatable {
  const AttendanceEvent();

  @override
  List<Object> get props => [];
}

class RetrieveAttendance extends AttendanceEvent {}

class CreateAttendance extends AttendanceEvent {
  final Attendance data;
  const CreateAttendance(this.data);
}

class UpdateAttendance extends AttendanceEvent {
  final Attendance data;
  const UpdateAttendance(this.data);
}
