part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class RetrieveLocation extends LocationEvent {}

class CreateLocation extends LocationEvent {
  final Location data;
  const CreateLocation(this.data);
}

class UpdateLocation extends LocationEvent {
  final Location data;
  final bool newIsActive;
  const UpdateLocation({required this.data, required this.newIsActive});
}

class ActiveLocation extends LocationEvent {
  final Location data;
  const ActiveLocation({required this.data});
}

class DeleteLocation extends LocationEvent {
  final Location data;
  const DeleteLocation({required this.data});
}
