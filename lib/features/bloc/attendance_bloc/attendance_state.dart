part of 'attendance_bloc.dart';

abstract class AttendanceState extends Equatable {
  const AttendanceState();

  @override
  List<Object> get props => [];
}

class AttendanceInitial extends AttendanceState {}

class RetrieveAttendanceSuccess extends AttendanceState {
  final List<Attendance> data;
  const RetrieveAttendanceSuccess({this.data = const []});
}

class RetrieveAttendanceLoading extends AttendanceState {}

class RetrieveAttendanceFailure extends AttendanceState {
  final String message;
  const RetrieveAttendanceFailure({this.message = ""});
}

class CreateAttendanceSuccess extends AttendanceState {
  final String message;
  const CreateAttendanceSuccess({this.message = ""});
}

class CreateAttendanceLoading extends AttendanceState {}

class CreateAttendanceFailure extends AttendanceState {
  final String message;
  const CreateAttendanceFailure({this.message = ""});
}

class UpdateAttendanceSuccess extends AttendanceState {
  final String message;
  const UpdateAttendanceSuccess({this.message = ""});
}

class UpdateAttendanceLoading extends AttendanceState {}

class UpdateAttendanceFailure extends AttendanceState {
  final String message;
  const UpdateAttendanceFailure({this.message = ""});
}
