// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:attendance_app/domains/model/attendance.dart';
import 'package:attendance_app/domains/usecase/attendance_use_case.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AttendanceUseCase _attendanceUseCase;
  AttendanceBloc(this._attendanceUseCase) : super(AttendanceInitial()) {
    on<RetrieveAttendance>((event, emit) async {
      emit(RetrieveAttendanceLoading());
      final result = await _attendanceUseCase.findAllAttendance();
      result.fold((failure) {
        emit(RetrieveAttendanceFailure(message: failure.message));
      }, (data) {
        emit(RetrieveAttendanceSuccess(data: data));
      });
    });

    on<CreateAttendance>((event, emit) async {
      emit(CreateAttendanceLoading());
      final result = await _attendanceUseCase.insertAttendance(event.data);
      result.fold((failure) {
        emit(CreateAttendanceFailure(message: failure.message));
      }, (_) async {
        emit(const CreateAttendanceSuccess(message: "Check In successfully"));
      });
    });

    on<UpdateAttendance>((event, emit) async {
      emit(UpdateAttendanceLoading());
      final result = await _attendanceUseCase.updateAttendance(event.data);
      result.fold((failure) {
        emit(UpdateAttendanceFailure(message: failure.message));
      }, (_) async {
        emit(const UpdateAttendanceSuccess(message: "Check Out successfully"));
      });
    });
  }
}
