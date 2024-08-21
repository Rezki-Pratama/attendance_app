part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class RetrieveLocationSuccess extends LocationState {
  final List<Location> data;
  const RetrieveLocationSuccess({this.data = const []});
}

class RetrieveLocationLoading extends LocationState {}

class RetrieveLocationFailure extends LocationState {
  final String message;
  const RetrieveLocationFailure({this.message = ""});
}

class CreateLocationSuccess extends LocationState {
  final String message;
  const CreateLocationSuccess({this.message = ""});
}

class CreateLocationLoading extends LocationState {}

class CreateLocationFailure extends LocationState {
  final String message;
  const CreateLocationFailure({this.message = ""});
}

class UpdateLocationSuccess extends LocationState {
  final String message;
  const UpdateLocationSuccess({this.message = ""});
}

class UpdateLocationLoading extends LocationState {}

class UpdateLocationFailure extends LocationState {
  final String message;
  const UpdateLocationFailure({this.message = ""});
}

class ActiveLocationSuccess extends LocationState {
  final String message;
  const ActiveLocationSuccess({this.message = ""});
}

class ActiveLocationLoading extends LocationState {}

class ActiveLocationFailure extends LocationState {
  final String message;
  const ActiveLocationFailure({this.message = ""});
}

class DeleteLocationSuccess extends LocationState {
  final String message;
  const DeleteLocationSuccess({this.message = ""});
}

class DeleteLocationLoading extends LocationState {}

class DeleteLocationFailure extends LocationState {
  final String message;
  const DeleteLocationFailure({this.message = ""});
}
