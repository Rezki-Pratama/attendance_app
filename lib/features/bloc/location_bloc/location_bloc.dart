// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:attendance_app/domains/model/location.dart';
import 'package:attendance_app/domains/usecase/location_use_case.dart';
import 'package:equatable/equatable.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationUseCase _locationUseCase;
  LocationBloc(this._locationUseCase) : super(LocationInitial()) {
    on<RetrieveLocation>((event, emit) async {
      emit(RetrieveLocationLoading());
      final result = await _locationUseCase.findAllLocation();
      result.fold((failure) {
        emit(RetrieveLocationFailure(message: failure.message));
      }, (data) {
        emit(RetrieveLocationSuccess(data: data));
      });
    });

    on<CreateLocation>((event, emit) async {
      emit(CreateLocationLoading());
      final result = await _locationUseCase.insertLocation(event.data);
      result.fold((failure) {
        emit(CreateLocationFailure(message: failure.message));
      }, (_) async {
        emit(const CreateLocationSuccess(
            message: "Location successfully added"));
      });
    });

    on<UpdateLocation>((event, emit) async {
      emit(UpdateLocationLoading());
      final result = await _locationUseCase.updateLocation(event.data);
      result.fold((failure) {
        emit(UpdateLocationFailure(message: failure.message));
      }, (_) async {
        emit(const UpdateLocationSuccess(message: "Successfully updated"));
      });
    });

    on<ActiveLocation>((event, emit) async {
      emit(ActiveLocationLoading());
      final result = await _locationUseCase.activeLocation(event.data);
      result.fold((failure) {
        emit(ActiveLocationFailure(message: failure.message));
      }, (_) async {
        emit(const ActiveLocationSuccess(message: "Successfully activated"));
      });
    });

    on<DeleteLocation>((event, emit) async {
      emit(DeleteLocationLoading());
      final result = await _locationUseCase.deleteLocation(event.data);
      result.fold((failure) {
        emit(DeleteLocationFailure(message: failure.message));
      }, (_) async {
        emit(const DeleteLocationSuccess(
            message: "Location successfully deleted"));
      });
    });
  }
}
